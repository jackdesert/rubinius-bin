# *** This file is generated by InstructionParser ***

module CodeTools
  module GeneratorMethods
      def add_scope
        @stream << 0
        @ip += 1
        @current_block.add_stack(1, 0)
        @instruction = 0
      end

      def allow_private
        @stream << 1
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 1
      end

      def cast_array
        unless @instruction == 2 or @instruction == 29
          @stream << 2
          @ip += 1
        end
        @instruction = 2
      end

      def cast_for_multi_block_arg
        @stream << 3
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 3
      end

      def cast_for_single_block_arg
        @stream << 4
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 4
      end

      def cast_for_splat_block_arg
        @stream << 5
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 5
      end

      def cast_multi_value
        @stream << 6
        @ip += 1
        @current_block.add_stack(1, 1)
        @instruction = 6
      end

      def check_frozen
        @stream << 7
        @ip += 1
        @current_block.add_stack(1, 1)
        @instruction = 7
      end

      def check_interrupts
        @stream << 8
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 8
      end

      def check_serial(arg1, arg2)
        arg1 = find_literal(arg1)
        @stream << 9 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(1, 1)
        @instruction = 9
      end

      def check_serial_private(arg1, arg2)
        arg1 = find_literal(arg1)
        @stream << 10 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(1, 1)
        @instruction = 10
      end

      def clear_exception
        @stream << 11
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 11
      end

      def create_block(arg1)
        arg1 = add_generator(arg1)
        @stream << 12 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 12
      end

      def dup
        @stream << 13
        @ip += 1
        @current_block.add_stack(1, 2)
        @instruction = 13
      end

      def dup_many(arg1)
        arg1 = Integer(arg1)
        @stream << 14 << arg1
        @ip += 2
        @current_block.add_stack(arg1, (arg1 * 2))
        @instruction = 14
      end

      def ensure_return
        @stream << 15
        @ip += 1
        @current_block.add_stack(1, 1)
        @current_block.close true
        @current_block = new_basic_block
        @instruction = 15
      end

      def find_const(arg1)
        arg1 = find_literal(arg1)
        @stream << 16 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 16
      end

      def goto(arg1)
        location = @ip + 1
        @stream << 17 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(0, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        @current_block = new_basic_block
        @instruction = 17
      end

      def goto_if_equal(arg1)
        location = @ip + 1
        @stream << 18 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(2, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 18
      end

      def goto_if_false(arg1)
        location = @ip + 1
        @stream << 19 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 19
      end

      def goto_if_nil(arg1)
        location = @ip + 1
        @stream << 20 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 20
      end

      def goto_if_not_equal(arg1)
        location = @ip + 1
        @stream << 21 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(2, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 21
      end

      def goto_if_not_nil(arg1)
        location = @ip + 1
        @stream << 22 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 22
      end

      def goto_if_not_undefined(arg1)
        location = @ip + 1
        @stream << 23 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 23
      end

      def goto_if_true(arg1)
        location = @ip + 1
        @stream << 24 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 24
      end

      def goto_if_undefined(arg1)
        location = @ip + 1
        @stream << 25 << arg1
        @ip += 2
        arg1.used_at location
        @current_block.add_stack(1, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 25
      end

      def instance_of
        @stream << 26
        @ip += 1
        @current_block.add_stack(2, 1)
        @instruction = 26
      end

      def invoke_primitive(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 27 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2, 1)
        @instruction = 27
      end

      def kind_of
        @stream << 28
        @ip += 1
        @current_block.add_stack(2, 1)
        @instruction = 28
      end

      def make_array(arg1)
        arg1 = Integer(arg1)
        @stream << 29 << arg1
        @ip += 2
        @current_block.add_stack(arg1, 1)
        @instruction = 29
      end

      def move_down(arg1)
        @stream << 30 << arg1
        @ip += 2
        @current_block.add_stack(arg1, (arg1 * 1))
        @instruction = 30
      end

      def noop
        @stream << 31
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 31
      end

      def object_to_s(arg1)
        arg1 = find_literal(arg1)
        @stream << 32 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 32
      end

      def passed_arg(arg1)
        @stream << 33 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 33
      end

      def passed_blockarg(arg1)
        arg1 = Integer(arg1)
        @stream << 34 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 34
      end

      def pop
        @stream << 35
        @ip += 1
        @current_block.add_stack(1, 0)
        @instruction = 35
      end

      def pop_many(arg1)
        arg1 = Integer(arg1)
        @stream << 36 << arg1
        @ip += 2
        @current_block.add_stack(arg1, 0)
        @instruction = 36
      end

      def pop_unwind
        @stream << 37
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 37
      end

      def push_block
        @stream << 38
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 38
      end

      def push_block_arg
        @stream << 39
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 39
      end

      def push_const(arg1)
        arg1 = find_literal(arg1)
        @stream << 40 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 40
      end

      def push_cpath_top
        @stream << 41
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 41
      end

      def push_current_exception
        @stream << 42
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 42
      end

      def push_exception_state
        @stream << 43
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 43
      end

      def push_false
        @stream << 44
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 44
      end

      def push_has_block
        @stream << 45
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 45
      end

      def push_int(arg1)
        @stream << 46 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 46
      end

      def push_ivar(arg1)
        arg1 = find_literal(arg1)
        @stream << 47 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 47
      end

      def emit_push_literal(arg1)
        @stream << 48 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 48
      end

      alias_method :push_literal, :emit_push_literal

      def push_local(arg1)
        @stream << 49 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 49
      end

      def push_local_depth(arg1, arg2)
        @stream << 50 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(0, 1)
        @instruction = 50
      end

      def push_memo(arg1)
        arg1 = find_literal(arg1)
        @stream << 51 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 51
      end

      def push_mirror
        @stream << 52
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 52
      end

      def push_my_field(arg1)
        @stream << 53 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 53
      end

      def push_my_offset(arg1)
        @stream << 54 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 54
      end

      def push_nil
        @stream << 55
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 55
      end

      def push_proc
        @stream << 56
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 56
      end

      def push_rubinius
        @stream << 57
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 57
      end

      def push_scope
        @stream << 58
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 58
      end

      def push_self
        @stream << 59
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 59
      end

      def push_stack_local(arg1)
        @stream << 60 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 60
      end

      def push_true
        @stream << 61
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 61
      end

      def push_type
        @stream << 62
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 62
      end

      def push_undef
        @stream << 63
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 63
      end

      def push_variables
        @stream << 64
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 64
      end

      def raise_break
        @stream << 65
        @ip += 1
        @current_block.add_stack(1, 1)
        @current_block.close false
        @current_block = new_basic_block
        @instruction = 65
      end

      def raise_exc
        @stream << 66
        @ip += 1
        @current_block.add_stack(1, 0)
        @current_block.close false
        @current_block = new_basic_block
        @instruction = 66
      end

      def raise_return
        @stream << 67
        @ip += 1
        @current_block.add_stack(1, 1)
        @current_block.close true
        @current_block = new_basic_block
        @instruction = 67
      end

      def reraise
        @stream << 68
        @ip += 1
        @current_block.add_stack(0, 0)
        @current_block.close false
        @current_block = new_basic_block
        @instruction = 68
      end

      def restore_exception_state
        @stream << 69
        @ip += 1
        @current_block.add_stack(1, 0)
        @instruction = 69
      end

      def ret(arg1)
        arg1 = Integer(arg1)
        @stream << 70 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @current_block.close true
        @current_block = new_basic_block
        @instruction = 70
      end

      def rotate(arg1)
        arg1 = Integer(arg1)
        @stream << 71 << arg1
        @ip += 2
        @current_block.add_stack(arg1, (arg1 * 1))
        @instruction = 71
      end

      def send_method(arg1)
        arg1 = find_literal(arg1)
        @stream << 72 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 72
      end

      def send_stack(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 73 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2+1, 1)
        @instruction = 73
      end

      def send_stack_with_block(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 74 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2+2, 1)
        @instruction = 74
      end

      def send_stack_with_splat(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 75 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2+3, 1)
        @instruction = 75
      end

      def send_super_stack_with_block(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 76 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2+1, 1)
        @instruction = 76
      end

      def send_super_stack_with_splat(arg1, arg2)
        arg1 = find_literal(arg1)
        arg2 = Integer(arg2)
        @stream << 77 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(arg2+2, 1)
        @instruction = 77
      end

      def send_vcall(arg1)
        arg1 = find_literal(arg1)
        @stream << 78 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instruction = 78
      end

      def set_call_flags(arg1)
        @stream << 79 << arg1
        @ip += 2
        @current_block.add_stack(0, 0)
        @instruction = 79
      end

      def set_const(arg1)
        arg1 = find_literal(arg1)
        @stream << 80 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 80
      end

      def set_const_at(arg1)
        arg1 = find_literal(arg1)
        @stream << 81 << arg1
        @ip += 2
        @current_block.add_stack(2, 1)
        @instruction = 81
      end

      def set_ivar(arg1)
        arg1 = find_literal(arg1)
        @stream << 82 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 82
      end

      def set_local(arg1)
        @stream << 83 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 83
      end

      def set_local_depth(arg1, arg2)
        @stream << 84 << arg1 << arg2
        @ip += 3
        @current_block.add_stack(1, 1)
        @instruction = 84
      end

      def set_stack_local(arg1)
        @stream << 85 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 85
      end

      def setup_unwind(arg1, arg2)
        location = @ip + 1
        @stream << 86 << arg1 << arg2
        @ip += 3
        arg1.used_at location
        @current_block.add_stack(0, 0)
        @current_block.left = arg1.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 86
      end

      def shift_array
        @stream << 87
        @ip += 1
        @current_block.add_stack(1, 2)
        @instruction = 87
      end

      def store_my_field(arg1)
        @stream << 88 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 88
      end

      def string_append
        @stream << 89
        @ip += 1
        @current_block.add_stack(2, 1)
        @instruction = 89
      end

      def string_build(arg1)
        arg1 = Integer(arg1)
        @stream << 90 << arg1
        @ip += 2
        @current_block.add_stack(arg1, 1)
        @instruction = 90
      end

      def string_dup
        @stream << 91
        @ip += 1
        @current_block.add_stack(1, 1)
        @instruction = 91
      end

      def swap
        @stream << 92
        @ip += 1
        @current_block.add_stack(2, 2)
        @instruction = 92
      end

      def unwind(arg1)
        @stream << 93 << arg1
        @ip += 2
        @instruction = 93
      end

      def yield_debugger
        @stream << 94
        @ip += 1
        @current_block.add_stack(0, 0)
        @instruction = 94
      end

      def yield_splat(arg1)
        arg1 = Integer(arg1)
        @stream << 95 << arg1
        @ip += 2
        @current_block.add_stack(arg1+1, 1)
        @instruction = 95
      end

      def yield_stack(arg1)
        arg1 = Integer(arg1)
        @stream << 96 << arg1
        @ip += 2
        @current_block.add_stack(arg1, 1)
        @instruction = 96
      end

      def zsuper(arg1)
        arg1 = find_literal(arg1)
        @stream << 97 << arg1
        @ip += 2
        @current_block.add_stack(1, 1)
        @instruction = 97
      end

      def push_file
        @stream << 98
        @ip += 1
        @current_block.add_stack(0, 1)
        @instruction = 98
      end

      # Parsing Expression Grammar instructions
      def p_any(arg1)
        @stream << 99 << arg1
        @ip += 2
        @instruction = 99
      end

      def p_call(arg1)
        @stream << 100 << arg1
        @ip += 2
        @instruction = 100
      end

      def p_char(arg1)
        @stream << 101 << arg1
        @ip += 2
        @instruction = 101
      end

      def p_char_set(arg1)
        @stream << 102 << arg1
        @ip += 2
        @instruction = 102
      end

      def p_choice(arg1, arg2)
        @stream << 103 << arg1 << arg2
        @ip += 3
        @instruction = 103
      end

      def p_commit(arg1)
        @stream << 104 << arg1
        @ip += 2
        @instruction = 104
      end

      def p_commit_back(arg1)
        @stream << 105 << arg1
        @ip += 2
        @instruction = 105
      end

      def p_commit_partial(arg2)
        @stream << 106 << arg1
        @ip += 2
        @instruction = 106
      end

      def p_end
        @stream << 107
        @ip += 1
        @instruction = 107
      end

      def p_fail
        @stream << 108
        @ip += 1
        @instruction = 108
      end

      def p_fail_twice
        @stream << 109
        @ip += 1
        @instruction = 109
      end

      def p_jump(arg1)
        @stream << 110 << arg1
        @ip += 2
        @instruction = 110
      end

      def p_return
        @stream << 111
        @ip += 1
        @instruction = 111
      end

      def p_span(arg1)
        @stream << 112 << arg1
        @ip += 2
        @instruction = 112
      end

      def p_test_any(arg1, arg2)
        @stream << 113 << arg1 << arg2
        @ip += 3
        @instruction = 113
      end

      def p_test_char(arg1, arg2)
        @stream << 114 << arg1 << arg2
        @ip += 3
        @instruction = 114
      end

      def p_test_char_set(arg1, arg2)
        @stream << 115 << arg1 << arg2
        @ip += 3
        @instruction = 115
      end

      def p_init(arg1, arg2)
        @stream << 116 << arg1 << arg2
        @ip += 3
        @instruction = 116
      end

      # Instrumentation instructions
      def m_bytes(arg1, arg2)
        @stream << 117 << arg1 << arg2
        @ip += 3
        @instruction = 117
      end

      def m_counter(arg1)
        @stream << 118 << arg1
        @ip += 2
        @instruction = 118
      end

      def m_sum(arg1, arg2)
        @stream << 119 << arg1 << arg2
        @ip += 3
        @instruction = 119
      end

      def m_value(arg1, arg2)
        @stream << 120 << arg1 << arg2
        @ip += 3
        @instruction = 120
      end

      def m_time_stamp(arg1, arg2)
        @stream << 121 << arg1 << arg2
        @ip += 3
        @instruction = 121
      end

      def m_timer_start(arg1)
        @stream << 122 << arg1
        @ip += 2
        @instruction = 122
      end

      def m_timer_stop(arg1, arg2)
        @stream << 123 << arg1 << arg2
        @ip += 3
        @instruction = 123
      end

      # Branching instructions
      def b_if_serial(arg1, arg2, arg3)
        location = @ip + 3
        @stream << 124 << arg1 << arg2 << arg3
        @ip += 4
        arg3.used_at location
        @current_block.left = arg3.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 124
      end

      def b_if_int(arg1, arg2, arg3)
        location = @ip + 3
        @stream << 125 << arg1 << arg2 << arg3
        @ip += 4
        arg3.used_at location
        @current_block.left = arg3.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 125
      end

      def b_if(arg1, arg2)
        location = @ip + 2
        @stream << 126 << arg1 << arg2
        @ip += 3
        arg2.used_at location
        @current_block.left = arg2.basic_block
        @current_block.close
        block = new_basic_block
        @current_block.right = block
        @current_block = block
        @instruction = 126
      end

      # Register movement instructions
      def r_load_local(arg1, arg2)
        @stream << 127 << arg1 << arg2
        @ip += 3
        @instructions = 127
      end

      def r_store_local(arg1, arg2)
        @stream << 128 << arg1 << arg2
        @ip += 3
        @instructions = 128
      end

      def r_load_local_depth(arg1, arg2, arg3)
        @stream << 129 << arg1 << arg2 << arg3
        @ip += 4
        @instructions = 129
      end

      def r_store_local_depth(arg1, arg2, arg3)
        @stream << 130 << arg1 << arg2 << arg3
        @ip += 4
        @instructions = 130
      end

      def r_load_stack(arg1)
        @stream << 131 << arg1
        @ip += 2
        @instructions = 131
      end

      def r_store_stack(arg1)
        @stream << 132 << arg1
        @ip += 2
        @current_block.add_stack(0, 1)
        @instructions = 132
      end

      def r_load_literal(arg1, arg2)
        @stream << 133 << arg1 << arg2
        @ip += 3
        @instruction = 133
      end

      def r_load_int(arg1, arg2)
        @stream << 134 << arg1 << arg2
        @ip += 3
        @instruction = 134
      end

      def r_store_int(arg1, arg2)
        @stream << 135 << arg1 << arg2
        @ip += 3
        @instruction = 135
      end

      def r_copy(arg1, arg2)
        @stream << 136 << arg1 << arg2
        @ip += 3
        @instruction = 136
      end

      # Native signed integer instructions
      def n_iadd(arg1, arg2, arg3)
        @stream << 137 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 137
      end

      def n_isub(arg1, arg2, arg3)
        @stream << 138 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 138
      end

      def n_imul(arg1, arg2, arg3)
        @stream << 139 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 139
      end

      def n_idiv(arg1, arg2, arg3)
        @stream << 140 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 140
      end

      def n_iadd_o(arg1, arg2, arg3)
        @stream << 141 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 141
      end

      def n_isub_o(arg1, arg2, arg3)
        @stream << 142 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 142
      end

      def n_imul_o(arg1, arg2, arg3)
        @stream << 143 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 143
      end

      def n_idiv_o(arg1, arg2, arg3)
        @stream << 144 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 144
      end

      def n_ieq(arg1, arg2, arg3)
        @stream << 145 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 145
      end

      def n_ine(arg1, arg2, arg3)
        @stream << 146 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 146
      end

      def n_ilt(arg1, arg2, arg3)
        @stream << 147 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 147
      end

      def n_ile(arg1, arg2, arg3)
        @stream << 148 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 148
      end

      def n_igt(arg1, arg2, arg3)
        @stream << 149 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 149
      end

      def n_ige(arg1, arg2, arg3)
        @stream << 150 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 150
      end

      def n_ipopcnt(arg1, arg2)
        @stream << 151 << arg1 << arg2
        @ip += 3
        @instruction = 151
      end

      def m_log(arg1)
        @stream << 152 << arg1
        @ip += 2
        @instruction = 152
      end

      def m_debug
        @stream << 153
        @ip += 1
        @instruction = 153
      end

      def e_cache_method_p(arg1, arg2, arg3)
        @stream << 154 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 154
      end

      def e_cache_function_p(arg1, arg2, arg3)
        @stream << 155 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 155
      end

      def e_cache_value_p(arg1, arg2)
        @stream << 156 << arg1 << arg2
        @ip += 3
        @instruction = 156
      end

      def e_cache_method(arg1, arg2)
        @stream << 157 << arg1 << arg2
        @ip += 3
        @instruction = 157
      end

      def e_cache_function(arg1, arg2)
        @stream << 158 << arg1 << arg2
        @ip += 3
        @instruction = 158
      end

      def e_cache_value(arg1, arg2)
        @stream << 159 << arg1 << arg2
        @ip += 3
        @instruction = 159
      end

      def e_resolve_method(arg1, arg2, arg3)
        @stream << 160 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 160
      end

      def e_resolve_receiver_method(arg1, arg2, arg3)
        @stream << 161 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 161
      end

      def e_resolve_function(arg1, arg2, arg3)
        @stream << 162 << arg1 << arg2 << arg3
        @ip += 4
        @instruction = 162
      end

      def e_resolve_scope_constant(arg1, arg2)
        @stream << 163 << arg1 << arg2
        @ip += 3
        @instruction = 163
      end

      def e_resolve_path_constant(arg1, arg2)
        @stream << 164 << arg1 << arg2
        @ip += 3
        @instruction = 164
      end

      def e_signature(arg1)
        @stream << 165 << arg1
        @ip += 2
        @instruction = 165
      end

      def e_check_signature(arg1, arg2)
        @stream << 166 << arg1 << arg2
        @ip += 3
        @instruction = 166
      end

      def e_invoke_method(arg1, arg2)
        @stream << 167 << arg1 << arg2
        @ip += 3
        @instruction = 167
      end

      def e_invoke_function(arg1, arg2)
        @stream << 168 << arg1 << arg2
        @ip += 3
        @instruction = 168
      end

      def a_instance(arg1, arg2)
        @stream << 169 << arg1 << arg2
        @ip += 3
        @instruction = 169
      end

      def a_kind(arg1, arg2)
        @stream << 170 << arg1 << arg2
        @ip += 3
        @instruction = 170
      end

      def a_method(arg1, arg2)
        @stream << 171 << arg1 << arg2
        @ip += 3
        @instruction = 171
      end

      def a_receiver_method(arg1, arg2)
        @stream << 172 << arg1 << arg2
        @ip += 3
        @instruction = 172
      end

      def a_type(arg1, arg2)
        @stream << 173 << arg1 << arg2
        @ip += 3
        @instruction = 173
      end

      def a_function(arg1, arg2)
        @stream << 174 << arg1 << arg2
        @ip += 3
        @instruction = 174
      end

      def a_equal(arg1, arg2)
        @stream << 175 << arg1 << arg2
        @ip += 3
        @instruction = 175
      end

      def a_not_equal(arg1, arg2)
        @stream << 176 << arg1 << arg2
        @ip += 3
        @instruction = 176
      end

      def a_less(arg1, arg2)
        @stream << 177 << arg1 << arg2
        @ip += 3
        @instruction = 177
      end

      def a_less_equal(arg1, arg2)
        @stream << 178 << arg1 << arg2
        @ip += 3
        @instruction = 178
      end

      def a_greater(arg1, arg2)
        @stream << 179 << arg1 << arg2
        @ip += 3
        @instruction = 179
      end

      def a_greater_equal(arg1, arg2)
        @stream << 180 << arg1 << arg2
        @ip += 3
        @instruction = 180
      end

  end
end
