/* Import */
// : [C Standard Library]
#include <errno.h>   // Error Number
#include <stdbool.h> // Standard Boolean

// : [C++ Standard Library]
#include <cstdarg> // C Standard Arguments
#include <cstddef> // C Standard Definitions
#include <cstdio>  // C Standard Input/ Output
#include <cstdlib> // C Standard Library
#include <cstring> // C String
#include <new>     // New

/* Phase > ... */
static void INITIATE ();
       void RESET    ();
       void TERMINATE();
       void UPDATE   ();

void TERMINATE(char const[], ...);

/* Namespace */
// : Source
namespace Source {
  static char const *CODE      = NULL;
  static FILE       *FILE      = NULL;
  static char const *FILE_PATH = NULL;
  static std::size_t SIZE      = 0uL;

  // ...
  static char const* getFileName();
}

// : Parser
namespace Parser {
  struct Token;

  // ...
  static std::size_t TOKEN_COUNT = 0u;
  static Token      *TOKENS = NULL;
  static std::size_t TOKENS_CAPACITY = 0u;

  static char const* afterCommentToken              (char const[], std::size_t const);
  static char const* afterIdentifierToken           (char const[], std::size_t const);
  static char const* afterMultilineCommentBeginToken(char const[], std::size_t const);
  static char const* afterMultilineCommentEndToken  (char const[], std::size_t const);
  static char const* afterNewline                   (char const[], std::size_t const);
  static char const* afterSinglelineCommentToken    (char const[], std::size_t const);
  static char const* afterStringToken               (char const[], std::size_t const);
  static char const* afterSymbolToken               (char const[], std::size_t const);
  static char const* afterWhitespace                (char const[], std::size_t const);
  static bool compareStringToken(char const[], char const[], std::size_t const, std::size_t const);
  static std::size_t  getBytesAllocated();
  static std::size_t& getTraceSize     ();
  static char const* logBytesAllocated();
  static char const* logTrace         (char const[], std::size_t const, std::size_t);

  /* ... */
  struct Token /* final */ {
    char *code;
    std::size_t column;
    std::size_t line;
    enum Type { COMMENT, IDENTIFIER, STRING, SYMBOL } type;

    // ...
    Token(Type const type, char const code[], std::size_t const line, std::size_t const column) :
      code  (const_cast<char*>(code)),
      column(column),
      line  (line),
      type  (type)
    {}

    // ...
    char* getBegin() { return this -> getBegin(Parser::TOKENS, Parser::TOKEN_COUNT, Source::CODE, Source::SIZE); }
    char* getBegin(Token const* const, std::size_t const, char const[], std::size_t const) const {
      return this -> code;
    }

    char* getEnd() const { return this -> getEnd(Parser::TOKENS, Parser::TOKEN_COUNT, Source::CODE, Source::SIZE); }
    char* getEnd(Token const* const tokens, std::size_t const count, char const code[], std::size_t const length) const {
      return this + 1 == tokens + count ? const_cast<char*>(code + length) : (this + 1) -> code;
    }

    std::size_t getLength() const { return this -> getLength(Parser::TOKENS, Parser::TOKEN_COUNT, Source::CODE, Source::SIZE); }
    std::size_t getLength(Token const* const tokens, std::size_t const count, char const code[], std::size_t const length) const {
      return this -> getEnd(tokens, count, code, length) - this -> getBegin(tokens, count, code, length);
    }
  };
}

// : Error
namespace Error {
  static char const INVALID_TOKEN[] = "[Syntax Error in \"%s:%u:%u\"]: Invalid token `%c`" "\r\n" "%s";

  static char const OUT_OF_MEMORY[] = "[Memory Error]: Usable memory exhausted (%s allocated)";

  static char const TARGET_FILE_NOT_FOUND    [] = "[I/O Error]: Unable to find source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_OPENED   [] = "[I/O Error]: Unable to open source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_READ     [] = "[I/O Error]: Unable to read source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_SPECIFIED[] = "[Error]: Source file not specified";
}

/* Function > ... */
char const* Parser::afterCommentToken(char const code[], std::size_t const length) {
  char const *const multilined  = Parser::afterMultilineCommentBeginToken(code, length);
  char const *const singlelined = Parser::afterSinglelineCommentToken    (code, length);

  if (NULL != multilined ) return multilined;
  if (NULL != singlelined) return singlelined;

  return NULL;
}

char const* Parser::afterIdentifierToken(char const code[], std::size_t const length) {
  if (length) switch (*code) {
    case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9':
    case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
    case 'a': case 'b': case 'c': case 'd': case 'e': case 'f': case 'g': case 'h': case 'i': case 'j': case 'k': case 'l': case 'm': case 'n': case 'o': case 'p': case 'q': case 'r': case 's': case 't': case 'u': case 'v': case 'w': case 'x': case 'y': case 'z':
    case '_':
      return code + 1;
  }

  return NULL;
}

char const* Parser::afterMultilineCommentBeginToken(char const code[], std::size_t const length) {
  return length && ('/' == code[0] && '*' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterMultilineCommentEndToken(char const code[], std::size_t const length) {
  return length && ('*' == code[0] && '/' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterNewline(char const code[], std::size_t const length) {
  if (length > 0u && '\n' == *code) return code + 1;
  if (length > 1u && ('\r' == code[0] && '\n' == code[1])) return code + 2;

  return NULL;
}

char const* Parser::afterSinglelineCommentToken(char const code[], std::size_t const length) {
  return length && ('/' == code[0] && '/' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterStringToken(char const code[], std::size_t const length) {
  if (length) switch (*code) {
    case '"': case '\'':
      return code + 1;
  }

  return NULL;
}

char const* Parser::afterSymbolToken(char const code[], std::size_t const length) {
  if (length) switch (*code) {
    case '!': case '"': case '%': case '&': case '\'': case '(': case ')': case '*': case '+': case ',': case '-': case '.': case '/': case ':': case ';': case '<': case '=': case '>': case '?': case '[': case '\\': case ']': case '^': case '_': case '{': case '|': case '}':
      return code + 1;
  }

  return NULL;
}

char const* Parser::afterWhitespace(char const code[], std::size_t const length) {
  char const *const newlined = Parser::afterNewline(code, length);

  if (length && ' ' == *code) return code + 1;
  if (NULL != newlined) return newlined;

  return NULL;
}

bool Parser::compareStringToken(char const tokenA[], char const tokenB[], std::size_t const lengthA, std::size_t const lengthB) {
  if (lengthA && lengthB) {
    return *tokenA == *tokenB;
  }

  return NULL;
}

std::size_t Parser::getBytesAllocated() {
  return (
    Parser::getTraceSize()  * sizeof(char const) +
    Parser::TOKENS_CAPACITY * sizeof(Token)      +
    Source::SIZE            * sizeof(char const)
  );
}

std::size_t& Parser::getTraceSize() {
  static std::size_t capacity = 0u;
  return capacity;
}

char const* Parser::logBytesAllocated() {
  static char string[48u];
  std::size_t size = Parser::getBytesAllocated();
  float metricSize = size;
  enum metric_t { giga = 0x1u, kilo, mega } metric = static_cast<metric_t>(0x0u);
  char *iterator = string;

  // ...
  if (metricSize >= 1024.0f) { metric = kilo; metricSize /= 1024.0f; }
  if (metricSize >= 1024.0f) { metric = mega; metricSize /= 1024.0f; }
  if (metricSize >= 1024.0f) { metric = giga; metricSize /= 1024.0f; }
  if (metricSize >= 1024.0f) { metric = static_cast<metric_t>(0x0u); }

  // ...
  if (0u == size) *(iterator++) = '0';
  else for (unsigned char delimit = 0u; size; ++delimit) {
    if (delimit == 3u) { *(iterator++) = ','; delimit = 0u; }
    *(iterator++) = "0123456789"[size % 10u]; size /= 10u;
  }

  *iterator = ' ';
  for (char *begin = string, *end = iterator - 1; begin < end; ++begin, --end) { *begin ^= *end; *end ^= *begin; *begin ^= *end; }
  for (char const *subiterator = "bytes"; '\0' != *subiterator; ++subiterator) *++iterator = *subiterator;

  // ...
  if (metric != static_cast<metric_t>(0x0u)) {
    *++iterator = ' ';
    *++iterator = '(';
    size = metricSize;
    metricSize -= size;

    // ...
    for (char *begin = ++iterator; size; size /= 10u) {
      for (char *subiterator = ++iterator; begin != subiterator; --subiterator)
      *subiterator = *(subiterator - 1);

      *begin = "0123456789"[size % 10u];
    }

    if (0.0f != metricSize) {
      *(iterator++) = '.';
      for (unsigned char length = 3u; length; --length) {
        unsigned char const value = (metricSize *= 10.0f);

        if (0u == value) break;
        else { *(iterator++) = "0123456789"[value]; metricSize -= value; }
      }
    }

    switch (metric) {
      case giga: std::strcpy(iterator, " GB)"); break;
      case kilo: std::strcpy(iterator, " KB)"); break;
      case mega: std::strcpy(iterator, " MB)"); break;
    } iterator += 4u;
  }

  // ...
  *++iterator = '\0';

  // ...
  return string;
}

char const* Parser::logTrace(char const line[], std::size_t const length, std::size_t index) {
  std::size_t &capacity = Parser::getTraceSize();
  std::size_t const size = 8u + index + length;
  static char *string;

  string = static_cast<char*>(std::malloc(size * sizeof(char)));
  if (NULL != string) {
    char *iterator = string;

    capacity = size;
    std::strcpy (iterator, " | ");        iterator += 3;
    std::strncpy(iterator, line, length); iterator += length;
    std::strcpy (iterator, "\r\n" " | "); iterator += 5;

    while (--index) *++iterator = '~';
    std::strcpy(iterator, "^");
  }

  // ...
  return string;
}

char const* Source::getFileName() {
  char const *name = Source::FILE_PATH;

  while ('\0' != *name) ++name;
  while (Source::FILE_PATH != name && ('\\' != *name && '/' != *name)) --name;

  return name + (Source::FILE_PATH != name);
}

/* Main */
int main(int const, char* const arguments[]) {
  long position;

  // ... ->> Open source script for reading
  Source::FILE_PATH = const_cast<char const*>(arguments[1]);
  if (NULL == Source::FILE_PATH) TERMINATE(Error::TARGET_FILE_NOT_SPECIFIED);

  Source::FILE = std::fopen(Source::FILE_PATH, "rb");
  if (ENOENT == errno) TERMINATE(Error::TARGET_FILE_NOT_FOUND, Source::getFileName(), std::strerror(ENOENT));
  else if (NULL == Source::FILE) TERMINATE(Error::TARGET_FILE_NOT_OPENED, Source::getFileName(), std::strerror(errno));

  // ... ->> Prepare source script for reading
  position = std::ftell(Source::FILE);
  if (position == -1L) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), std::strerror(errno));
  if (0 != std::fseek(Source::FILE, 0L, SEEK_END)) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), "Cannot seek file stream");
  Source::SIZE = position;

  position = std::ftell(Source::FILE);
  if (position == -1L) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), std::strerror(errno));
  if (0 != std::fseek(Source::FILE, 0L, SEEK_SET)) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), "Cannot seek file stream");
  Source::SIZE = position - Source::SIZE;

  Source::CODE = static_cast<char const*>(std::malloc(Source::SIZE * sizeof(char const)));
  if (NULL == Source::CODE) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), std::strerror(ENOMEM));

  // ... ->> Read source script
  std::fread(const_cast<char*>(Source::CODE), sizeof(char), Source::SIZE, Source::FILE);

  if (0 != std::ferror(Source::FILE)) TERMINATE(Error::TARGET_FILE_NOT_READ, Source::getFileName(), "Cannot read file stream");

  // ... ->> Close source script from reading
  std::fclose(Source::FILE);

  // ... ->> Parse source script
  INITIATE();
  TERMINATE();

  return EXIT_SUCCESS;
}

/* Phase */
/* : Initiate */
void INITIATE() {
  typedef Parser::Token Token;

  bool commenting   = false;
  bool identifying  = false;
  bool stringifying = false;

  std::size_t column = 1u;
  std::size_t line   = 1u;

  // ... [Tokenize]
  for (char const *current = Source::CODE, *recent = Source::CODE; ; ++current) {
    std::size_t const currentLength = Source::SIZE - (current - Source::CODE);
    std::size_t const recentLength  = Source::SIZE - (recent  - Source::CODE);

    char const *tokenCode = NULL;
    Token::Type tokenType;

    char const *const commented   = Parser::afterCommentToken   (current, currentLength);
    char const *const identified  = Parser::afterIdentifierToken(current, currentLength);
    char const *const newlined    = Parser::afterNewline        (current, currentLength);
    char const *const stringified = Parser::afterStringToken    (current, currentLength);
    char const *const symbolized  = Parser::afterSymbolToken    (current, currentLength);
    char const *const whitespaced = Parser::afterWhitespace     (current, currentLength);

    // : [Persisted State]
    if (commenting) {
      char const *const multilined = Parser::afterMultilineCommentEndToken(current, currentLength);

      // : [Multi-line Comment]
      if (NULL != multilined && NULL != Parser::afterMultilineCommentBeginToken(recent, recentLength)) {
        commenting = false;
        current = multilined - 1;
      }

      // : [Single-line Comment]
      if (NULL != newlined && NULL != Parser::afterSinglelineCommentToken(recent, recentLength)) {
        bool escaped = false;

        for (char const *iterator = current; iterator-- != recent; ) {
          if ('\\' != *iterator) break;
          escaped = false == escaped;
        }

        if (false == escaped) {
          commenting = false;
          current = newlined - 1;
        }
      }
    }

    else if (stringifying) {
      if (NULL != stringified && Parser::compareStringToken(current, recent, currentLength, recentLength)) {
        bool escaped = false;

        for (char const *iterator = current; iterator-- != recent; ) {
          if ('\\' != *iterator) break;
          escaped = false == escaped;
        }

        if (false == escaped) {
          current = stringified - 1;
          stringifying = false;
        }
      }
    }

    else if (identifying) {
      if (NULL == identified) {
        --current;
        identifying = false;
      }
    }

    // : [Detected State]
    else if (NULL != commented) {
      tokenCode = current;
      tokenType = Token::COMMENT;

      commenting = true;
      current = commented - 1;
    }

    else if (NULL != stringified) {
      tokenCode = current;
      tokenType = Token::STRING;

      current = stringified - 1;
      stringifying = true;
    }

    else if (NULL != identified) {
      tokenCode = current;
      tokenType = Token::IDENTIFIER;

      current = identified - 1;
      identifying = true;
    }

    else if (NULL != symbolized) {
      tokenCode = current;
      tokenType = Token::SYMBOL;

      current = symbolized - 1;
    }

    else if (NULL != whitespaced)
      current = whitespaced - 1;

    // : ...
    else if (currentLength) {
      std::size_t length = currentLength;

      for (char const *iterator = Source::CODE + currentLength; Source::SIZE != length; ++iterator, ++length)
      if (NULL != Parser::afterNewline(iterator, iterator - Source::CODE)) break;

      TERMINATE(Error::INVALID_TOKEN, Source::FILE_PATH, line, column, *current, Parser::logTrace(Source::CODE + (currentLength - (column - 1u)), (length - currentLength) + (column - 1u), column));
    }

    // ...
    if (NULL != tokenCode) {
      if (Parser::TOKEN_COUNT == Parser::TOKENS_CAPACITY) {
        std::size_t size = 0u != Parser::TOKENS_CAPACITY ? Parser::TOKENS_CAPACITY / 2u : 256u;
        void *allocation;

        while (true) {
          allocation = std::realloc(Parser::TOKENS, (Parser::TOKENS_CAPACITY + size) * sizeof(Token));

          // ...
          if (NULL != allocation) break;

          if (0u != size) size /= 2u;
          else TERMINATE(Error::OUT_OF_MEMORY, Parser::logBytesAllocated());
        }

        Parser::TOKENS = static_cast<Token*>(allocation);
        Parser::TOKENS_CAPACITY += size;
      }

      new (Parser::TOKENS + Parser::TOKEN_COUNT++) Token(tokenType, tokenCode, line, column);
      recent = tokenCode;
    }

    // ...
    if (NULL == newlined) ++column;
    else { column = 1u; ++line; }

    // ...
    if (0u == currentLength) break;
  }

  if (Parser::TOKEN_COUNT < Parser::TOKENS_CAPACITY) {
    void *const allocation = std::realloc(Parser::TOKENS, Parser::TOKEN_COUNT * sizeof(Token));
    if (NULL != allocation) Parser::TOKENS = static_cast<Token*>(allocation);
  }

  // ... [Parse]
  for (Token *iterator = Parser::TOKENS; Parser::TOKEN_COUNT != static_cast<std::size_t>(iterator - Parser::TOKENS); ++iterator) {
    std::printf("[%u]: (%u : %s) \"", iterator - Parser::TOKENS, iterator -> getLength(),
      Token::COMMENT    == iterator -> type ? "COMMENT"    :
      Token::IDENTIFIER == iterator -> type ? "IDENTIFIER" :
      Token::STRING     == iterator -> type ? "STRING"     :
      Token::SYMBOL     == iterator -> type ? "SYMBOL"     :
      "..."
    );
    std::fwrite(iterator -> code, sizeof(char), iterator -> getLength(), stdout);
    std::printf("%3s", "\"" "\r\n");
  }
}

/* : Terminate */
void TERMINATE() {
  std::free(Parser::TOKENS);
  std::free(const_cast<char*>(Source::CODE));

  std::exit(EXIT_SUCCESS);
}

void TERMINATE(char const message[], ...) {
  std::va_list arguments;

  va_start(arguments, message);
    if (std::vfprintf(stderr, message, arguments) > -1)
    std::fwrite("\r\n" "\0", sizeof(char), 3u, stderr);
  va_end(arguments);

  std::exit(EXIT_SUCCESS);
}
