module Rubinius
  config = {}
  config[:config_file] = "/home/ubuntu/rubinius/build/config/config.rb"
  config[:command_line] = ["--llvm-config=llvm-config-5.0", "--cc=clang-5.0", "--cxx=clang++-5.0"]
  config[:build_make] = "make"
  config[:build_rake] = "rake"
  config[:build_perl] = "perl"
  config[:llvm_path] = nil
  config[:llvm_system_name] = nil
  config[:llvm_configure] = "llvm-config-5.0"
  config[:llvm_version] = "5.0.2"
  config[:llvm_api_version] = 500
  config[:llvm_shared] = false
  config[:llvm_shared_objs] = nil
  config[:llvm_cxxflags] = ""
  config[:llvm_ldflags] = "-L/usr/lib/llvm-5.0/lib"
  config[:cc] = "clang-5.0"
  config[:cxx] = "clang++-5.0"
  config[:ldshared] = "clang-5.0 -shared"
  config[:ldsharedxx] = "clang++-5.0 -shared"
  config[:gcc_major] = "4.2"
  config[:user_cflags] = ""
  config[:user_cxxflags] = ""
  config[:user_cppflags] = ""
  config[:user_ldflags] = ""
  config[:system_cflags] = "-fPIC"
  config[:system_cxxflags] = "-std=c++11 "
  config[:system_cppflags] = ""
  config[:system_ldflags] = "-Wl,--export-dynamic -lrt -lcrypt -ldl -lpthread -latomic "
  config[:include_dirs] = ["/home/ubuntu/rubinius/build/libraries/libsodium/src/libsodium/include", "/usr/local/include"]
  config[:lib_dirs] = ["/home/ubuntu/rubinius/build/libraries/libsodium/src/libsodium/.libs/", "/usr/local/lib"]
  config[:defines] = ["HAS_EXECINFO", "HAVE_SPT_REUSEARGV", "HAVE_CLOCK_GETTIME", "HAVE_NL_LANGINFO", "HAVE_POSIX_FADVISE", "HAVE_STRNLEN", "HAVE_TIMERFD", "HAVE_INOTIFY", "HAVE_STRUCT_STAT_ST_ATIM", "HAVE_STRUCT_STAT_ST_MTIM", "HAVE_STRUCT_STAT_ST_CTIM", "HAVE_TM_GMTOFF", "HAVE_TM_ZONE", "HAVE_TIMEZONE", "HAVE_TZNAME", "HAVE_DAYLIGHT", "HAVE_ALLOCA_H", "HAVE_STRING_H", "HAVE_SYS_TIME_H", "HAVE_SYS_TIMES_H", "HAVE_SYS_TYPES_H", "HAVE_UNISTD_H", "HAVE_STDARG_H", "STRERROR_R_CHAR_P"]
  config[:curses] = "-lcurses"
  config[:host] = "x86_64-unknown-linux-gnu"
  config[:cpu] = "x86_64"
  config[:vendor] = "unknown"
  config[:os] = "linux-gnu"
  config[:little_endian] = true
  config[:sizeof_long] = 8
  config[:x86_64] = true
  config[:aarch64] = false
  config[:dtrace] = false
  config[:dtrace_const] = false
  config[:debug_build] = false
  config[:sourcedir] = "/home/ubuntu/rubinius"
  config[:builddir] = "/home/ubuntu/rubinius/build/rubinius"
  config[:scriptdir] = "/home/ubuntu/rubinius/build/scripts"
  config[:bootstrap_gems_dir] = "/home/ubuntu/rubinius/build/libraries/gems"
  config[:capi_includedir] = "/home/ubuntu/rubinius/machine/include/capi"
  config[:build_libdir] = "/home/ubuntu/rubinius/build/libraries"
  config[:build_exe] = "/home/ubuntu/rubinius/build/rubinius/bin/rbx"
  config[:build_bin] = "/home/ubuntu/rubinius/build/bin"
  config[:prefixdir] = "/home/ubuntu/rubinius"
  config[:bindir] = "/bin"
  config[:libdir] = "/library"
  config[:encdir] = "/site/x86_64-linux-gnu/encoding/converter"
  config[:runtimedir] = "/runtime"
  config[:codedbdir] = "/codedb"
  config[:coredir] = "/core"
  config[:sitedir] = "/site"
  config[:archdir] = "/site/x86_64-linux-gnu"
  config[:vendordir] = "/vendor"
  config[:includedir] = "/machine/include/capi"
  config[:mandir] = "/man"
  config[:gemsdir] = "/gems"
  config[:gems_cache] = "/home/ubuntu/rubinius/build/libraries/cache"
  config[:gems_list] = "/home/ubuntu/rubinius/gems_list.txt"
  config[:gem_files] = ["bundler-1.16.1.gem", "daedalus-core-1.6.gem", "ffi2-generators-0.1.1.gem", "json-1.8.6.gem", "minitest-5.11.1.gem", "psych-2.0.17.gem", "racc-1.4.14.gem", "rake-12.3.0.gem", "rb-readline-0.5.5.gem", "rdoc-5.1.0.gem", "redcard-1.1.0.gem", "rubinius-ast-3.15.gem", "rubinius-bridge-3.0.gem", "rubinius-code-3.0.gem", "rubinius-compiler-3.33.gem", "rubinius-coverage-2.1.gem", "rubinius-debugger-2.6.gem", "rubinius-developer_tools-2.0.0.gem", "rubinius-instructions-3.0.gem", "rubinius-melbourne-3.11.gem", "rubinius-processor-3.4.gem", "rubinius-profiler-2.1.gem", "rubinius-toolset-3.0.gem", "rubysl-2.2.0.gem", "rubysl-abbrev-2.0.4.gem", "rubysl-base64-2.0.0.gem", "rubysl-benchmark-2.0.1.gem", "rubysl-bigdecimal-2.0.2.gem", "rubysl-cgi-2.0.1.gem", "rubysl-cgi-session-2.1.0.gem", "rubysl-cmath-2.0.0.gem", "rubysl-complex-2.0.0.gem", "rubysl-continuation-2.0.0.gem", "rubysl-coverage-2.1.gem", "rubysl-csv-2.0.2.gem", "rubysl-curses-2.0.1.gem", "rubysl-date-2.0.9.gem", "rubysl-delegate-2.0.1.gem", "rubysl-digest-2.0.8.gem", "rubysl-drb-2.0.1.gem", "rubysl-e2mmap-2.0.0.gem", "rubysl-english-2.0.0.gem", "rubysl-enumerator-2.0.0.gem", "rubysl-erb-2.0.2.gem", "rubysl-etc-3.0.gem", "rubysl-expect-2.0.0.gem", "rubysl-fcntl-3.0.gem", "rubysl-fiber-2.0.0.gem", "rubysl-fileutils-2.0.3.gem", "rubysl-find-2.0.1.gem", "rubysl-forwardable-2.0.1.gem", "rubysl-getoptlong-2.0.0.gem", "rubysl-gserver-2.0.0.gem", "rubysl-io-console-2.0.0.gem", "rubysl-io-nonblock-2.0.0.gem", "rubysl-io-wait-2.0.0.gem", "rubysl-ipaddr-2.0.0.gem", "rubysl-irb-2.1.1.gem", "rubysl-logger-2.1.0.gem", "rubysl-mathn-2.0.0.gem", "rubysl-matrix-2.1.0.gem", "rubysl-mkmf-2.1.gem", "rubysl-monitor-2.1.gem", "rubysl-mutex_m-2.0.0.gem", "rubysl-net-ftp-2.0.1.gem", "rubysl-net-http-2.0.4.gem", "rubysl-net-imap-2.0.1.gem", "rubysl-net-pop-2.0.1.gem", "rubysl-net-protocol-2.0.1.gem", "rubysl-net-smtp-2.0.1.gem", "rubysl-net-telnet-2.0.0.gem", "rubysl-nkf-2.0.1.gem", "rubysl-observer-2.0.0.gem", "rubysl-open-uri-2.0.0.gem", "rubysl-open3-2.0.0.gem", "rubysl-openssl-2.10.gem", "rubysl-optparse-2.0.1.gem", "rubysl-ostruct-2.1.0.gem", "rubysl-pathname-2.3.gem", "rubysl-prettyprint-2.0.3.gem", "rubysl-prime-2.0.1.gem", "rubysl-profile-2.0.0.gem", "rubysl-profiler-2.1.gem", "rubysl-pstore-2.0.0.gem", "rubysl-pty-2.0.3.gem", "rubysl-rational-2.0.1.gem", "rubysl-readline-2.0.2.gem", "rubysl-resolv-2.1.2.gem", "rubysl-rexml-2.0.4.gem", "rubysl-rinda-2.0.1.gem", "rubysl-rss-2.0.0.gem", "rubysl-scanf-2.0.0.gem", "rubysl-securerandom-2.0.0.gem", "rubysl-set-2.0.1.gem", "rubysl-shellwords-2.0.0.gem", "rubysl-singleton-2.0.0.gem", "rubysl-socket-2.2.1.gem", "rubysl-stringio-2.2.gem", "rubysl-strscan-2.0.0.gem", "rubysl-sync-2.0.0.gem", "rubysl-syslog-3.0.gem", "rubysl-tempfile-2.0.1.gem", "rubysl-thread-2.1.gem", "rubysl-thwait-2.0.0.gem", "rubysl-time-2.0.3.gem", "rubysl-timeout-2.0.0.gem", "rubysl-tmpdir-2.0.1.gem", "rubysl-tsort-2.0.1.gem", "rubysl-un-2.0.0.gem", "rubysl-unicode_normalize-2.0.gem", "rubysl-uri-2.0.0.gem", "rubysl-weakref-2.0.0.gem", "rubysl-webrick-2.0.0.gem", "rubysl-xmlrpc-2.0.0.gem", "rubysl-yaml-2.1.0.gem", "rubysl-zlib-2.0.1.gem"]
  config[:installed_gems] = ["bundler-1.16.1.gem", "minitest-5.11.1.gem", "racc-1.4.14.gem", "rake-12.3.0.gem", "rdoc-5.1.0.gem", "rb-readline-0.5.5.gem", "rubysl-readline-2.0.2.gem", "test-unit-3.2.7.gem"]
  config[:program_name] = "rbx"
  config[:bin_links] = ["ruby", "rake", "gem", "irb", "rdoc", "ri", "erb"]
  config[:use_bin_links] = true
  config[:rpath] = true
  config[:windows] = false
  config[:darwin] = false
  config[:bsd] = false
  config[:linux] = true
  config[:vendor_zlib] = false
  config[:vendor_libsodium] = true
  config[:vm_release_h] = "/home/ubuntu/rubinius/machine/release.h"
  config[:ruby_version] = "2.3.1"
  config[:ruby_libversion] = 23

  if Rubinius.constants.map { |x| x.to_s }.include?("BUILD_CONFIG")
    self::BUILD_CONFIG.replace config
  else
    self::BUILD_CONFIG = config
  end
end
