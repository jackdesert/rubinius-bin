require "rubinius/coverage/version"

module Rubinius
  class Coverage
    class CFG
      attr_accessor :code, :call_sites, :basic_blocks, :enter, :exit

      def initialize(code, call_sites)
        @code = code
        @call_sites = call_sites
        @basic_blocks = Hash.new { |h, k| h[k] = BasicBlock.new k }
      end

      def graph
        iseq = @code.iseq
        total = iseq.size
        i = 0

        @enter = BasicBlock.new 0
        @enter.left = bb = @basic_blocks[0]

        @exit = @basic_blocks[total]

        while i < total
          opcode = InstructionSet[iseq[i]]

          if @basic_blocks.has_key? i
            bb.exit_ip = i-1
            bb = bb.left = @basic_blocks[i]
          else
            bb.exit_ip = i+opcode.width-1

            case opcode.control_flow
            when :branch
              bb.left = @basic_blocks[iseq[i+1]]
              bb.left.exit_ip = total

              next_bb = @basic_blocks[i+opcode.width]
              bb.right = next_bb if opcode.name != :goto

              bb = next_bb
            when :raise, :return
              bb.left = @exit
              bb = @basic_blocks[i+opcode.width]
            end
          end

          i += opcode.width
        end

        @basic_blocks.values.each do |bb|
          # Split if a jump target intersects our range
          i = bb.enter_ip
          while i < bb.exit_ip
            opcode = InstructionSet[iseq[i]]
            i += opcode.width

            if @basic_blocks.has_key? i
              bb.exit_ip = i-1

              if opcode.control_flow != :branch
                bb.left = @basic_blocks[i]
                bb.right = nil
              end

              break
            end
          end

          bb.coverage @code, @call_sites
        end

        stack = [@enter]
        cycles = {}

        until stack.empty?
          bb = stack.shift

          if left = bb.left
            left.count = bb.count if bb.count > left.count
            unless cycles.has_key? left
              stack << left
              cycles[left] = true
            end
          end

          if right = bb.right
            right.count = bb.count if bb.count > right.count
            unless cycles.has_key? right
              stack << right
              cycles[right] = true
            end
          end
        end

        # Flow coverage counts backwards
        @basic_blocks.values.each do |bb|
          if bb.count == 0
            if (bb.left and bb.left.count > 0) or
               (bb.right and bb.right.count > 0)
              bb.count = 1
            end
          end
        end
      end

      class BasicBlock
        attr_accessor :enter_ip, :exit_ip, :left, :right, :lines, :count

        def initialize(enter_ip)
          @enter_ip = @exit_ip = enter_ip
          @lines = []
          @count = 0
        end

        def coverage(code, call_sites)
          total = code.lines.size - 2
          i = 0

          while i < total
            if (@enter_ip < code.lines[i+2] and @exit_ip >= code.lines[i]) or
               (code.lines[i+2] == 0 and @enter_ip == 0)
              line = code.lines[i+1]
              @lines << line unless @lines.include? line
            end

            i += 2
          end

          call_sites.each do |cs|
            if cs.ip >= @enter_ip and cs.ip <= @exit_ip
              cs_count = cs.invokes + cs.hits + cs.misses
              @count = cs_count if cs_count > @count
            end
          end
        end
      end
    end

    # Coverage methods

    def start
      ObjectSpace.each_object(Rubinius::CallSite) { |cs| cs.reset }

      nil
    end

    def coverage(code)
      call_sites = code.call_sites
      return unless call_sites.any? { |cs| cs.invokes + cs.hits + cs.misses > 0 }

      cfg = CFG.new code, call_sites
      cfg.graph

      counts = {}

      total = code.lines.size
      i = 1

      while i < total
        counts[code.lines[i]] = 0
        i += 2
      end

      cfg.basic_blocks.values.each do |bb|
        bb.lines.each { |l| counts[l] = bb.count }
      end

      counts
    end

    def result
      code_coverage = Hash.new { |h, k| h[k] = [] }

      ObjectSpace.each_object(Rubinius::CompiledCode) do |code|
        lines = code_coverage[code.file.to_s]
        counts = coverage code
        next unless counts

        counts.each { |line, count| lines[line] = count }
      end

      code_coverage.delete_if { |k, v| v.empty? }
      code_coverage
    end
  end
end
