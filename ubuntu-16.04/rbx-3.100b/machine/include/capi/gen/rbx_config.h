#ifndef RBX_CONFIG
#define RBX_CONFIG

#define RBX_PROGRAM_NAME     "rbx"
#define RBX_HOST             "x86_64-unknown-linux-gnu"
#define RBX_CPU              "x86_64"
#define RBX_VENDOR           "unknown"
#define RBX_OS               "linux-gnu"
#define RBX_RUBY_LIB_VERSION 23
#define RBX_LDSHARED         "clang-5.0 -shared"
#define RBX_LDSHAREDXX       "clang++-5.0 -shared"
#define RBX_SIZEOF_LONG      8
#define RBX_LLVM_API_VER     500
#define RBX_LIBC             "libc.so.6"
#define RBX_HAVE_LCHMOD      false
#define RBX_HAVE_LCHOWN      true
#define RBX_HAVE_MKFIFO      true
#define RBX_DEBUG_BUILD      false
#define RBX_LLVM_VERSION     "5.0.2"
#define RBX_LITTLE_ENDIAN    1
#define RBX_HAVE_TR1         1
#define RBX_HAVE_TR1_HASH    1
#define RBX_LINUX           1
#define RBX_DTRACE_CONST     

#define HAS_EXECINFO         1
#define HAVE_SPT_REUSEARGV   1
#define HAVE_CLOCK_GETTIME   1
#define HAVE_NL_LANGINFO     1
#define HAVE_POSIX_FADVISE   1
#define HAVE_STRNLEN         1
#define HAVE_TIMERFD         1
#define HAVE_INOTIFY         1
#define HAVE_STRUCT_STAT_ST_ATIM 1
#define HAVE_STRUCT_STAT_ST_MTIM 1
#define HAVE_STRUCT_STAT_ST_CTIM 1
#define HAVE_TM_GMTOFF       1
#define HAVE_TM_ZONE         1
#define HAVE_TIMEZONE        1
#define HAVE_TZNAME          1
#define HAVE_DAYLIGHT        1
#define HAVE_ALLOCA_H        1
#define HAVE_STRING_H        1
#define HAVE_SYS_TIME_H      1
#define HAVE_SYS_TIMES_H     1
#define HAVE_SYS_TYPES_H     1
#define HAVE_UNISTD_H        1
#define HAVE_STDARG_H        1
#define STRERROR_R_CHAR_P    1

#include "detection.hpp"

#define RBX_STRERROR_BUFSIZE 256

// strerror_r has different signatures on GNU and XSI.
// - The GNU version returns a pointer to a string, which may be the one passed
//   to the function as 'buf', or some immutable static string, in which case
//   'buf' is unused.
// - The XSI version always stores the error message in 'buf' and returns 0 on
//   success.
// This macro makes sure that the error message is returned either way.
#ifdef STRERROR_R_CHAR_P
#define RBX_STRERROR(errno, buf, size) strerror_r(errno, buf, size)
#else
#define RBX_STRERROR(errno, buf, size) (strerror_r(errno, buf, size), buf)
#endif

// Enable this define for some minimal GC debugging
// #define RBX_GC_DEBUG

// Enable for GC stress. This only ensures that the interrupts
// for a GC are set. Use RBX_GC_STRESS_YOUNG and / or RBX_GC_STRESS_MATURE
// to run either the young or mature gen on each possibility
// #define RBX_GC_STRESS

// When stress testing is enabled, forces a young collection every time it
// is possible. This can be useful to flush out bugs because of moving objects.
// #define RBX_GC_STRESS_YOUNG

// When stress testing is enabled, forces a mature collection every time it
// is possible. This can be useful to flush out bugs with reachability etc.
// #define RBX_GC_STRESS_MATURE

#endif
