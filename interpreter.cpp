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
// : Utility
namespace Utility {
  template <typename type>
  #if __cplusplus >= 201703L
    constexpr
  #endif
  static type* launder(type* pointer) /* noexcept */ {
    #if __cplusplus >= 201703L && ( \
      (defined(__cpp_lib_launder) && __cpp_lib_launder >= 201606L) || \
      (defined(_MSC_VER) && defined(_HAS_LAUNDER)) || \
      (defined(_LIBCPP_VERSION) && (_LIBCPP_VERSION >= (defined(__ANDROID__) ? 7000 : 6000))) \
    )
      return std::launder(pointer);
    #elif ( \
      (defined(__clang__) || defined(__clang_major__) || defined(__clang_minor__) || defined(__clang_patchlevel__)) || \
      (defined(__GNUG__) || defined(__GNUC_MINOR__) || defined(__GNUC_PATCHLEVEL__)) \
    ) && defined(__builtin_launder)
      return __builtin_launder(pointer);
    #elif __cplusplus < 201703L
      #if defined(__GNUC__)
        __asm__("" : "+r"(pointer));
        return pointer;
      #elif __cplusplus < 201703L && (defined(__NT__) || defined(__TOS_WIN__) || defined(_WIN16) || defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(_WIN32_WCE) || defined(_WIN64) || defined(__WINDOWS__)) && defined(_ReadWriteBarrier)
        _ReadWriteBarrier();
        return pointer;
      #elif __cplusplus < 201703L
        return reinterpret_cast<type*>(pointer);
      #endif
    #else
      return static_cast<type*>(const_cast<void*>(static_cast<void const*>(pointer)));
    #endif
  }
}

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
  struct Token {
    char *code;
    std::size_t column;
    std::size_t line;
    enum Type { COMMENT, IDENTIFIER, SYMBOL, TEXT } type;

    protected:
      Token() {}

    public:
      Token(Type const type, char const code[], std::size_t const line, std::size_t const column) :
        code  (const_cast<char*>(code)),
        column(column),
        line  (line),
        type  (type)
      {}

      // ...
      char* getBegin(Token const* const, std::size_t const, char const[], std::size_t const) const {
        return this -> code;
      }

      char* getEnd(Token const* const tokens, std::size_t const count, char const code[], std::size_t const length) const {
        return this + 1 == tokens + count ? const_cast<char*>(code + length) : (this + 1) -> code;
      }

      std::size_t getLength(Token const* const tokens, std::size_t const count, char const code[], std::size_t const length) const {
        return this -> getEnd(tokens, count, code, length) - this -> getBegin(tokens, count, code, length);
      }
  };

  namespace Keyword {
    static char const ALIAS      [] = "alias";
    static char const BREAK      [] = "break";
    static char const CASE       [] = "case";
    static char const CLASS      [] = "class";
    static char const CONSTANT   [] = "const";
    static char const DEFAULT    [] = "default";
    static char const DO         [] = "do";
    static char const ELSE       [] = "else";
    static char const ENUMERATION[] = "enum";
    static char const FOR        [] = "for";
    static char const IF         [] = "if";
    static char const LONG       [] = "long";
    static char const OPERATOR   [] = "operator";
    static char const PRIVATE    [] = "private";
    static char const PUBLIC     [] = "public";
    static char const RETURN     [] = "return";
    static char const SHORT      [] = "short";
    static char const SIGNED     [] = "signed";
    static char const SIZEOF     [] = "sizeof";
    static char const STRUCTURE  [] = "struct";
    static char const SWITCH     [] = "switch";
    static char const UNSIGNED   [] = "unsigned";
    static char const USING      [] = "using";
    static char const VAR        [] = "var";
    static char const VOID       [] = "void";
    static char const WHILE      [] = "while";
  }

  struct Expression : public Token {
    Expression *children;
    std::size_t count;

    public:
      Expression() {
        this -> children = NULL;
        this -> code     = NULL;
        this -> column   = 0u;
        this -> count    = 0u;
        this -> line     = 0u;
      }

      Expression(Type const type, char const code[], std::size_t const line, std::size_t const column) :
        Token::Token(type, code, line, column),
        children(NULL), count(0u)
      {}

      ~Expression() {
        std::free(this -> children);
        this -> count = 0u;
      }

      // ...
      void addChildExpression(Expression const&);
      void removeChildExpression(Expression const&);
  };

  // ...
  static Expression SYNTAX_TREE = Expression();

  static std::size_t TOKEN_COUNT = 0u;
  static Token      *TOKENS = NULL;
  static std::size_t TOKENS_CAPACITY = 0u;

  // ...
  static char const* afterCharacterToken            (char const[], std::size_t const);
  static char const* afterCommentToken              (char const[], std::size_t const);
  static char const* afterIdentifierToken           (char const[], std::size_t const);
  static char const* afterMultilineCommentBeginToken(char const[], std::size_t const);
  static char const* afterMultilineCommentEndToken  (char const[], std::size_t const);
  static char const* afterNewline                   (char const[], std::size_t const);
  static char const* afterSinglelineCommentToken    (char const[], std::size_t const);
  static char const* afterStringToken               (char const[], std::size_t const);
  static char const* afterTextToken                 (char const[], std::size_t const);
  static char const* afterSymbolToken               (char const[], std::size_t const);
  static char const* afterWhitespace                (char const[], std::size_t const);
  static std::size_t  getBytesAllocated();
  static std::size_t& getTraceSize     ();
  static char const* logBytesAllocated();
  static char const* logTrace         (char const[], std::size_t const, std::size_t);
}

// : Error
namespace Error {
  static char const INVALID_TOKEN[] = "[Syntax Error in \"%s:%u:%u\"]: Invalid token `%1.*s`" "\r\n" "%s";

  static char const OUT_OF_MEMORY[] = "[Memory Error]: Usable memory exhausted (%s allocated)";

  static char const TARGET_FILE_NOT_FOUND    [] = "[I/O Error]: Unable to find source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_OPENED   [] = "[I/O Error]: Unable to open source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_READ     [] = "[I/O Error]: Unable to read source file \"%s\": \"%s\"";
  static char const TARGET_FILE_NOT_SPECIFIED[] = "[Error]: Source file not specified";
}

/* Function > ... */
char const* Parser::afterCharacterToken(char const code[], std::size_t const length) {
  return length && '\'' == *code ? code + 1 : NULL;
}

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
  return length > 1u && ('/' == code[0] && '*' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterMultilineCommentEndToken(char const code[], std::size_t const length) {
  return length > 1u && ('*' == code[0] && '/' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterNewline(char const code[], std::size_t const length) {
  if (length > 0u && '\n' == *code) return code + 1;
  if (length > 1u && ('\r' == code[0] && '\n' == code[1])) return code + 2;

  return NULL;
}

char const* Parser::afterSinglelineCommentToken(char const code[], std::size_t const length) {
  return length > 1u && ('/' == code[0] && '/' == code[1]) ? code + 2 : NULL;
}

char const* Parser::afterStringToken(char const code[], std::size_t const length) {
  return length && '"' == *code ? code + 1 : NULL;
}

char const* Parser::afterSymbolToken(char const code[], std::size_t const length) {
  if (length) switch (*code) {
    case '!': case '"': case '%': case '&': case '\'': case '(': case ')': case '*': case '+': case ',': case '-': case '.': case '/': case ':': case ';': case '<': case '=': case '>': case '?': case '@': case '[': case '\\': case ']': case '^': case '_': case '{': case '|': case '}': case '~':
      return code + 1;
  }

  return NULL;
}

char const* Parser::afterTextToken(char const code[], std::size_t const length) {
  char const *const character = Parser::afterCharacterToken(code, length);
  char const *const string    = Parser::afterStringToken   (code, length);

  if (NULL != character) return character;
  if (NULL != string   ) return string;

  return NULL;
}

char const* Parser::afterWhitespace(char const code[], std::size_t const length) {
  char const *const newlined = Parser::afterNewline(code, length);

  if (length && ' ' == *code) return code + 1;
  if (NULL != newlined) return newlined;

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

    while (--index) *(iterator++) = '~';
    *(iterator++) = '^';
    *(iterator++) = '\0';
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
  using namespace Parser::Keyword;
  typedef Parser::Token Token;

  bool commenting  = false;
  bool identifying = false;
  bool texting     = false;

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
    char const *const symbolized  = Parser::afterSymbolToken    (current, currentLength);
    char const *const texted      = Parser::afterTextToken      (current, currentLength);
    char const *const whitespaced = Parser::afterWhitespace     (current, currentLength);

    // : [Persisted State]
    if (commenting) {
      char const *const multilined = Parser::afterMultilineCommentEndToken(current, currentLength);

      // : [Multi-line Comment]
      if (NULL != multilined && NULL != Parser::afterMultilineCommentBeginToken(recent, recentLength)) {
        --column;
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

        current = newlined - 1;
        if (false == escaped) {
          --column;
          commenting = false;
        }
      }
    }

    else if (texting) {
      if (NULL != texted && (
        (NULL != Parser::afterCharacterToken(current, currentLength) && NULL != Parser::afterCharacterToken(recent, recentLength)) ||
        (NULL != Parser::afterStringToken   (current, currentLength) && NULL != Parser::afterStringToken   (recent, recentLength))
      )) {
        bool escaped = false;

        for (char const *iterator = current; iterator-- != recent; ) {
          if ('\\' != *iterator) break;
          escaped = false == escaped;
        }

        if (false == escaped) {
          --column;
          current = texted - 1;
          texting = false;
        }
      }
    }

    else if (identifying) {
      if (NULL == identified) {
        --column;
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

    else if (NULL != texted) {
      tokenCode = current;
      tokenType = Token::TEXT;

      current = texted - 1;
      texting = true;
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
      std::size_t length = 0u;

      for (char const *iterator = current; Source::SIZE != static_cast<std::size_t>(iterator - Source::CODE); ++iterator, ++length)
      if (NULL != Parser::afterNewline(iterator, iterator - Source::CODE)) break;

      TERMINATE(Error::INVALID_TOKEN, Source::FILE_PATH, line, column, '`' == *current ? 2 : 1, '`' == *current ? "\\`" : current, Parser::logTrace(current - (column - 1u), length + (column - 1u), column));
    }

    // ...
    if (NULL == newlined) ++column;
    else { column = 1u; ++line; }

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
    if (0u == currentLength) break;
  }

  // ...
  for (Token *iterator = Parser::TOKENS; Parser::TOKEN_COUNT != static_cast<std::size_t>(iterator - Parser::TOKENS); ++iterator) {
    Token *const token = Utility::launder(iterator);
    std::size_t const length = token -> getLength(Parser::TOKENS, Parser::TOKEN_COUNT, Source::CODE, Source::SIZE);

    static_cast<void>(length);
    switch (token -> type) {
      case Token::COMMENT: break;
      case Token::IDENTIFIER: {
        // static char const ALIAS      [] = "alias";
        // static char const BREAK      [] = "break";
        // static char const CASE       [] = "case";
        // static char const CLASS      [] = "class";
        // static char const CONSTANT   [] = "const";
        // static char const DEFAULT    [] = "default";
        // static char const DO         [] = "do";
        // static char const ELSE       [] = "else";
        // static char const ENUMERATION[] = "enum";
        // static char const FOR        [] = "for";
        // static char const IF         [] = "if";
        // static char const LONG       [] = "long";
        // static char const OPERATOR   [] = "operator";
        // static char const PRIVATE    [] = "private";
        // static char const PUBLIC     [] = "public";
        // static char const RETURN     [] = "return";
        // static char const SHORT      [] = "short";
        // static char const SIGNED     [] = "signed";
        // static char const SIZEOF     [] = "sizeof";
        // static char const STRUCTURE  [] = "struct";
        // static char const SWITCH     [] = "switch";
        // static char const UNSIGNED   [] = "unsigned";
        // static char const USING      [] = "using";
        // static char const VAR        [] = "var";
        // static char const VOID       [] = "void";
        // static char const WHILE      [] = "while";
      } break;

      case Token::TEXT: break;
      case Token::SYMBOL: {
      } break;
    }

    // std::printf("[%u]: (%u : %s) \"", token - Parser::TOKENS, length,
    //   Token::COMMENT    == token -> type ? "COMMENT"    :
    //   Token::IDENTIFIER == token -> type ? "IDENTIFIER" :
    //   Token::TEXT       == token -> type ? "TEXT"     :
    //   Token::SYMBOL     == token -> type ? "SYMBOL"     :
    //   "..."
    // );
    // std::fwrite(token -> code, sizeof(char), length, stdout);
    // std::printf("%3s", "\"" "\r\n");
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
