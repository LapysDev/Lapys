/* Import > ... */
#include <climits>
#include <cstdarg>
#include <cstddef>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <new>
#include <stdint.h>

#if defined(__APPLE__) || defined(__gnu_linux__) || defined(linux) || defined(__linux) || defined(__linux__) || defined(__MACH__) || defined(__unix) || defined(__unix__)
# include <fcntl.h>
# include <unistd.h>
# include <sys/types.h>
#elif defined(__NT__) || defined(__TOS_WIN__) || defined(_WIN16) || defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(_WIN32_WCE) || defined(_WIN64) || defined(__WINDOWS__)
# ifndef _WIN32_WINNT
#   define _WIN32_WINNT 0x0500
# endif
# include <windows.h>
#endif

/* Class > ... */
struct SyntaxTree {
  private:
    std::size_t capacity;

  public:
    SyntaxTree *children;
    std::size_t count;
    enum {
      BLOCK_BEGIN, BLOCK_END,
      CHARACTER_BEGIN, CHARACTER_END,
      DELIMITER,
      EXPRESSION,
      GROUP_BEGIN, GROUP_END,
      IDENTIFIER,
      KEYWORD,
      LITERAL,
      OPERATOR,
      SPECIFIER,
      STRING_BEGIN, STRING_END,
      SUBSCRIPT_BEGIN, SUBSCRIPT_END,
      TYPE, TYPE_OPERATOR
    } type;

    // ...
    inline SyntaxTree() : capacity(0u), children(NULL), count(0u) {}

    void addChild(SyntaxTree&);
};

struct Source {
  static bool       close(Source&);
  static bool       open (Source&, char const[]);
  static SyntaxTree parse(Source&);
  static char*      read (Source&, std::size_t const, char[]);

  // ...
  std::size_t column;
  void       *interface;
  char const *line;
  char const *name;
  std::size_t row;

  inline Source() : column(0u), interface(NULL), line(NULL), name(NULL), row(0u) {}
};

struct Allocation {
  void       *address;
  std::size_t size;

  inline Allocation(void* const address, std::size_t const size) : address(address), size(size) {}
};

/* Namespace > ... */
namespace Compiler {
  static unsigned long ALLOCATION_COUNT;
  static Allocation   *ALLOCATIONS;

  static void* allocate  (std::size_t const);
  static void* reallocate(void* const, std::size_t const);
  static void  release   (void* const);
}

namespace Error {
  enum {
    MEMORY_EXHAUSTED,
    SOURCE_INACCESSIBLE,
    SOURCE_UNSPECIFIED
  };

  static void raise(char const[]);
  static void raise(signed const);
  static void raise(unsigned const, char const[], ...);
}

/* Function > ... */
void* Compiler::allocate(std::size_t const size) {
  if (Compiler::ALLOCATION_COUNT == ULONG_MAX) return NULL;

  void *const allocation = std::malloc(size);
  unsigned compilerAllocationsCapacity = 0u != Compiler::ALLOCATION_COUNT;

  // ...
  if (NULL == allocation) return NULL;
  while (Compiler::ALLOCATION_COUNT > compilerAllocationsCapacity) compilerAllocationsCapacity *= 4u;

  if (compilerAllocationsCapacity == Compiler::ALLOCATION_COUNT) {
    unsigned const compilerAllocationsSize = 0u != Compiler::ALLOCATION_COUNT ? Compiler::ALLOCATION_COUNT * 4u : 1u;
    void    *const compilerAllocation      = std::realloc(Compiler::ALLOCATIONS, compilerAllocationsSize * sizeof(Allocation));

    if (NULL == compilerAllocation) { std::free(allocation); return NULL; }
    Compiler::ALLOCATIONS = static_cast<Allocation*>(compilerAllocation);
    new (Compiler::ALLOCATION_COUNT++ + Compiler::ALLOCATIONS) Allocation(allocation, size);
  }

  return allocation;
}

void* Compiler::reallocate(void* const address, std::size_t const size) {
  if (NULL == address) return Compiler::allocate(size);
  void *const allocation = std::realloc(address, size);

  // ...
  if (address != allocation) {
    for (Allocation *iterator = Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT; Compiler::ALLOCATIONS != iterator; )
    if (address == (--iterator) -> address) {
      iterator -> address = allocation;
      iterator -> size    = size;

      break;
    }
  }

  return allocation;
}

void Compiler::release(void* const address) {
  if (NULL == address) return;
  std::free(address);

  // ...
  for (void **iterator = Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT; Compiler::ALLOCATIONS != iterator; )
  if (address == *--iterator) {
    --Compiler::ALLOCATION_COUNT;
    iterator -> address = (Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT) -> address;
    iterator -> size    = (Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT) -> size;

    break;
  }
}

void Error::raise(char const message[]) {
  std::fprintf(stderr, "%7s%s%c", "Error: ", message, '\0');
  std::exit(EXIT_FAILURE);
}

void Error::raise(signed const code) {
  switch (code) {
    case Error::MEMORY_EXHAUSTED: {
      enum { UNIT, KILO, MEGA, GIGA };

      unsigned char scale = static_cast<unsigned>(UNIT);
      std::size_t   size  = Compiler::ALLOCATION_COUNT * sizeof(Allocation);

      // ...
      for (Allocation *iterator = Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT; Compiler::ALLOCATIONS != iterator; ) size += (--iterator) -> size;
      for (scaledSize = size; scaledSize > 1024.0f; scaledSize /= 1024.0f) { if (GIGA == ++scale) break; }

      std::fprintf(stderr, "%37s%lu%6s", "Error: " "Compiler resources exhausted; ", Compiler::ALLOCATION_COUNT, " bytes");
      switch (scale) {
        case GIGA: std::fprintf(stderr, " (%f%2s)", scale, "GB"); break;
        case KILO: std::fprintf(stderr, " (%f%2s)", scale, "KB"); break;
        case MEGA: std::fprintf(stderr, " (%f%2s)", scale, "MB"); break;
        default: break;
      }
      std::fputs(" used on process heap", stderr);
    } break;
    case Error::SOURCE_UNSPECIFIED: std::fputs("Error: " "Source file not specified", stderr); break;
    case SIGABRT: std::fputs("Interrupt: "      "Compiler aborted", stderr);                            break;
    case SIGFPE : std::fputs("Internal Error: " "Compiler violated floating-point arithmetic", stderr); break;
    case SIGILL : std::fputs("Internal Error: " "Compiler executed invalid instruction", stderr);       break;
    case SIGINT : std::fputs("Interrupt: "      "Compiler interrupted", stderr);                        break;
    case SIGSEGV: std::fputs("Internal Error: " "Compiler addressed invalid segment", stderr);          break;
    case SIGTERM: std::fputs("Interrupt: "      "Compiler terminated", stderr);                         break;
    default: std::fputs("Error", stderr); break;
  }

  std::fputc('\0', stderr);
  std::exit(EXIT_FAILURE);
}

void Error::raise(unsigned const code, char const format[], ...) {
  std::va_list arguments;

  // ...
  va_start(arguments, format);
  switch (code) {
    case Error::MEMORY_EXHAUSTED:
    case Error::SOURCE_UNSPECIFIED:
      return Error::raise(code);

    case Error::SOURCE_INACCESSIBLE:
    default: {
      std::fputs("Error: ", stderr);
      std::vfprintf(stderr, format, arguments);
    } break;
  }
  va_end(arguments);

  std::fputc('\0', stderr);
  std::exit(EXIT_FAILURE);
}

#if defined(__APPLE__) || defined(__gnu_linux__) || defined(linux) || defined(__linux) || defined(__linux__) || defined(__MACH__) || defined(__unix) || defined(__unix__)
  bool Source::close(Source& source) {
    return ::close(reinterpret_cast<intmax_t>(source.interface)) != -1;
  }

  bool Source::open(Source& source, char const name[]) {
    #ifdef O_LARGEFILE
      int const flag = O_LARGEFILE | O_RDONLY;
    #else
      int const flag = O_RDONLY;
    #endif
    int const descriptor = ::open(name, flag);

    // ...
    if (descriptor == -1) return false;
    source.interface = reinterpret_cast<void*>(descriptor);
    source.name      = name;
    return true;
  }

  char* Source::read(Source& source, std::size_t const length, char buffer[]) {
    ssize_t const count = ::read(reinterpret_cast<intmax_t>(source.interface), buffer, length * sizeof(char));
    return count == -1 ? NULL : (buffer + count);
  }
#elif defined(__NT__) || defined(__TOS_WIN__) || defined(_WIN16) || defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(_WIN32_WCE) || defined(_WIN64) || defined(__WINDOWS__)
  bool Source::close(Source& source) {
    return TRUE == ::CloseHandle(source.interface);
  }

  bool Source::open(Source& source, char const name[]) {
    HANDLE const handle = ::CreateFileA(name, GENERIC_READ, FILE_SHARE_READ, static_cast<LPSECURITY_ATTRIBUTES>(NULL), OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL | FILE_FLAG_NO_BUFFERING | FILE_FLAG_SEQUENTIAL_SCAN, static_cast<HANDLE>(NULL));

    // ...
    if (INVALID_HANDLE_VALUE == handle) return false;
    source.interface = handle;
    source.name      = name;
    return true;
  }

  char* Source::read(Source& source, std::size_t const length, char buffer[]) {
    if (length > (((static_cast<std::size_t>(1u) << (sizeof(DWORD) - 1u)) - 1u) << 1u) + 1u)
    return NULL;

    DWORD count;
    return TRUE == ::ReadFile(source.interface, buffer, length, &count, static_cast<LPOVERLAPPED>(NULL)) ? buffer + count : NULL;
  }
#else
  bool Source::close(Source& source) {
    return EOF != std::fclose(static_cast<std::FILE*>(source.interface));
  }

  bool Source::open(Source& source, char const name[]) {
    std::FILE *const stream = std::fopen(name, "rb");

    // ...
    if (NULL == stream) return false;
    source.interface = stream;
    source.name      = name;
    return true;
  }

  char* Source::read(Source& source, std::size_t const length, char buffer[]) {
    std::size_t const count = std::fread(buffer, sizeof(char), length, static_cast<std::FILE*>(source.interface));
    return count < length && 0x0 != std::ferror(static_cast<std::FILE*>(source.interface)) ? NULL : (buffer + count);
  }
#endif

SyntaxTree Source::parse(Source& source) {
  Source     *currentSource      = &source;
  char       *sourceCode         = NULL;
  std::size_t sourceCodeCapacity = 0u;
  bool        sourceCodeGrowth   = true;
  Source     *sourceTree         = NULL;
  std::size_t sourceTreeCapacity = 0u;
  std::size_t sourceTreeLength   = 0u;

  // ...
  while (true) {
    char const *code;
    std::size_t length;

    // ...
    if (sourceCodeGrowth) {
      std::size_t const size = 0u != sourceCodeCapacity ? sourceCodeCapacity * 2u : 256u;
      void *const allocation = Compiler::reallocate(sourceCode, size * sizeof(char));

      // ...
      if (NULL != allocation) { sourceCode = static_cast<char*>(allocation); sourceCodeCapacity = size; }
      else if (NULL == sourceCode) Error::raise(Error::MEMORY_EXHAUSTED);
      else sourceCodeGrowth = false;
    }

    // ...
    code = Source::read(*currentSource, sourceCodeCapacity, sourceCode);
    if (NULL == code) Error::raise(Error::SOURCE_INACCESSIBLE, "%8s%s%17s", "Source \"", currentSource -> name, "\" is not readable");

    // ...
    for (char const *iterator = sourceCode; code != iterator; ++iterator) {
      static_cast<void>(iterator);
      // std::size_t column;
      // void       *interface;
      // char const *line;
      // char const *name;
      // std::size_t row;
    }

    // ...
    if (length != sourceCodeCapacity) {
      if (sourceTreeLength == 0u) break;

      if (sourceTreeLength != 1u) currentSource = sourceTree + --sourceTreeLength;
      else { currentSource = &source; sourceTreeLength = 0u; }

      continue;
    }
  }

  Compiler::release(sourceTree);
}

/* Main */
int main(int, char* arguments[]) {
  Source source = Source();

  // ...
  Compiler::ALLOCATION_COUNT = 0u;
  Compiler::ALLOCATIONS      = NULL;

  std::signal(SIGABRT, static_cast<void (*)(signed)>(&Error::raise));
  std::signal(SIGFPE,  static_cast<void (*)(signed)>(&Error::raise));
  std::signal(SIGILL,  static_cast<void (*)(signed)>(&Error::raise));
  std::signal(SIGINT,  static_cast<void (*)(signed)>(&Error::raise));
  std::signal(SIGSEGV, static_cast<void (*)(signed)>(&Error::raise));
  std::signal(SIGTERM, static_cast<void (*)(signed)>(&Error::raise));

  if (NULL == arguments[1]) Error::raise(Error::SOURCE_UNSPECIFIED);
  if (false == Source::open(source, arguments[1])) Error::raise(Error::SOURCE_INACCESSIBLE, "%25s%s%12s", "Unable to access source \"", arguments[1], "\" to compile");

  static_cast<void>(Source::parse(source));

  // ...
  for (Allocation *iterator = Compiler::ALLOCATIONS + Compiler::ALLOCATION_COUNT; Compiler::ALLOCATIONS != iterator; ) std::free((--iterator) -> address);
  std::free(Compiler::ALLOCATIONS);

  return EXIT_SUCCESS;
}
