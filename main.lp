// Automatic Semi-colon Insertion;
// camelCase and PascalCase preferred
// File Encoding Precedence: UTF-8 → UTF-16 LE → UTF-16 BE → UTF-32 → [system-based] → ASCII
/* Multi-line Comment /* with nesting allowed */ */
// Single-line Comment

#import <internal-path>;                        // Determined by compiler install directory
#import "relative-path";                        // Determined by current working directory
#import "C:/LapysDev/main/Lapys/absolute-path"; // Determined by filesystem

/* Keywords */
// Qualifiers
addr;      // Addressing only allowed through this qualification; maybe be used standalone to denote generic address
auto;      // Automatic type deduction
function;  // Optional specifier denoting a function
namespace; // Denotes a named scope
ref;       // Referencing only allowed through this qualification
temp;      // Temporary object deduction
type;      // Denotes type parameter in generic arguments

// Evaluators
addrof    (…); // Evaluates address of object
alignof   (…); // Evaluates `byte` alignment of specified expression/ type
assert    (…); // Exits the compilation step if constant-evaluated condition is false
instanceof(…); // Denotes object of specified type in unevaluated context
nilof     (…); // Overloadable function denoting empty/ null object of specified type
sizeof    (…); // Evaluates `byte` size of specified expression/ type
typeof    (…); // Deduces type of specified expression/ type

// Constants
null

// Alternatives
and
not
or
xor

// Operators
^^;         // Boolean XOR
&&=;        // Compound boolean AND
break    …; // Ends iterative/ nested label (otherwise `…; break;`)
continue …; // Jumps iterative/ nested label (otherwise `…; continue;`)
defer    …; // Defers `…` to end of scope
||=;        // Compound boolean OR
|…|;        // Absolution operator
0o;         // Octal notation
as;         // Converts one type to another
delete …;   // `destruct <typeof …>(…)`
new T(…);   // `construct<T>       (…, alloc<Storage::HEAP>(sizeof T))`

/* Types */
// Qualifiers
(…);        // Specifies functional type
+;          // Specifies integral   type (based on its `sizeof(…)`)
..;         // Refers to previous top-level object (skips first member/ subobject) in expression
..1;        // Refers to first object in expression
..2;        // Refers to second object in expression
..n;        // Refers to last object in expression
?;          // Specifies nullable   type
@;          // Dereferences `addr`-qualified object
[];         // Specifies collection type
[…];        // Specifies collection type
alias;      // Specifies aliased    type
class;      // Specifies structured type
const;      // Immutable value; never truly constant unless evaluated at compile-time
enum;       // Specifies enumerable collection type; scoped by default
inherits;   // Inherits from specified class
long;       // Doubles size of integral type
noconst;    // Prevents `const` propagation to subobject
noinherit;  // Prevents class inheritance
nooperator; // Prevents additional operator overloads beyond what it defined itself
noreturn;   // Prevents function return
noscope;    // Injects subobjects onto current scope
nothrow;    // Exception handling explicitly not supported
short;      // Halves size of integral type
signed;     // Treats integral type as signed
static;     // Static-allocated storage
threaded;   // Thread-local storage
union;      // Specifies conjunctive type
unsigned;   // Treats integral type as non-signed
void;       // Ignores (return expression) type

// Native-only
alias bit  = …;           // Occupies minimum of one `byte`, but prefers packing multiple `bit`s on the same (stack) frame (`unsigned` only)
alias bool = …;           // Differs from `byte` due to similar pack preference to `bit` (`unsigned` by default)
alias byte = …;           // Smallest unit for hardware storage (`unsigned` by default)
alias umax = uintmax = …; // Largest  unit for hardware instructions
alias umin = uintmin = …; // Smallest unit for hardware instructions
alias word = …;           // Default  unit for hardware instructions (`unsigned` by default)

alias usize = …;
alias u8    = uint8   = unsigned …;
alias u16   = uint16  = long u8;
alias u32   = uint32  = long u16;
alias u64   = uint64  = long u32;
alias u128  = uint128 = long u64;

alias imax  = intmax = signed umax;
alias imin  = intmin = signed imin;
alias isize = signed usize;
alias i8    = int8   = signed …;
alias i16   = int16  = long i8;
alias i32   = int32  = long i16;
alias i64   = int64  = long i32;
alias i128  = int128 = long i64;

// Standard-defined
class A {}
class A::B {}

class<uintmin width> uintwidth noinherit nooperator {
  #private
    bit[width] value; // Zero-sized subobjects do not contribute to the size of their object

  #public
    #constructor(const uintwidth<width> = 0u);
    intwidth<width> #operator signed() const; // Enforced compile-time sign checks
    /* … */
}

class<uintmin width> intwidth noinherit nooperator {
  #private
    bool                           sign;
    uintwidth<width - (.. != 0hu)> value;

  #public
    #constructor(const intwidth <width>);
    #constructor(const uintwidth<width - (.. != 0hu)> = 0u);

    uintwidth<width> #operator unsigned() const; // Enforced compile-time sign checks
    /* … */
}

class<usize significance = 8zu, usize place = 23zu> float noinherit nooperator {
  #private
    class noscope {
      bool              sign;
      bit[significance] characteristics;
      bit[place]        mantissa;
    } value;

  #public
    #constructor(const float ref);
    #constructor(const intwidth<place + significance + 1zu> = 0);

    float ref #operator =(const float);
    #operator intwidth<place + significance + 1zu>() const;
    /* … */
}

class byte_buffer noinherit nooperator {
  #public  const usize     length;
  #private byte addr const value;

  #public
    #constexpr #operator addr() const;
}

class bigfloat noinherit nooperator;
class bigint   noinherit nooperator;
class biguint  noinherit nooperator;

alias char = byte;
alias f16  = float<5zu,  10zu>;
alias f32  = float<8zu,  23zu>;
alias f64  = float<11zu, 52zu>;
alias f128 = float<15zu, 112zu>;
alias int  = signed   word;
alias uint = unsigned word;

class<uintwidth<10hu> = …> string noinherit nooperator; // UTF-8 encoded by default but defers to the File Encoding Precedence
  namespace string<…>::encoding {
    noscope enum type inherits uintwidth<10hu> noinherit nooperator {
      …,
      US_ASCII, ANSI_X3_4_1968 = US_ASCII, ANSI_X3_4_1986 = US_ASCII, cp367 = US_ASCII, csASCII = US_ASCII, IBM367 = US_ASCII, iso_ir_6 = US_ASCII, ISO646_US = US_ASCII, ISO_646_irv_1991 = US_ASCII, us = US_ASCII,
      us_dk,    csUSDK    = us_dk,
      UTF_16,   csUTF16   = UTF_16,
      UTF_16BE, csUTF16BE = UTF_16BE,
      UTF_16LE, csUTF16LE = UTF_16LE,
      UTF_32,   csUTF32   = UTF_32,
      UTF_32BE, csUTF32BE = UTF_32BE,
      UTF_32LE, csUTF32LE = UTF_32LE,
      UTF_7,    csUTF7    = UTF_7,
      UTF_8,    csUTF8    = UTF_8,
      …
    }
  }

class<string::encoding::type encoding> string noinherit nooperator {
  namespace string::encoding; // Must be declared if already previously defined; `#public` access
  alias usize = bit[…];       // One bit smaller than `usize`

  #private
    const usize             length;
    const bool              sliced;
    const char[] const addr value;

    // …
    #constructor<usize length>(const char[length] value, const bool sliced)
      length = length;
      sliced = sliced;
      value  = value;
    {}

  #public
    #get usize length() const {
      return this.length; // `this.length`  refers to the subobject
                          // `this.#length` refers to the getter/ setter; externally referred to without the `#` prefix
    }

    // …
    #constructor<usize length>(const char[length] value)
      #constructor<length>(value, false);
    {}

    // …
    bool #operator ==(const string) const;
    string #operator [](const isize index) const;
    string #operator [](const isize start, const isize end) const;

    /* … */
}

class iterator {
  // Compile-time checks to see if `auto iterator = begin()`, `++iterator` and `(begin() == end()) as bool` is possible
  #constexpr #iterable addr begin() const;
  #constexpr #iterable addr end  () const;
}

class operator {
  // There are also `postfix`, `prefix`, `ternary`, and `unary` options
  // can definitely be used for Unicode source code security vulnerability shenanigans
  // but I don't care ¯\_(ツ)_/¯
  bool #operator(binary) "💙 loves"(const auto) const {
    return true;
  }

  // — can only be done for class types
  static bool #operator(binary) "💙 loves"(const operator a, const operator b) {
    return false;
  }
}

function auto lambda(auto x, auto y) { return x + y; }
(auto x, auto y) => x + y;
(x, y) => x + y;
n => n + n;

/* Standard library features (may contain magic) */
import <allocator>;     // Provides a variety of memory management schemes
import <array>;         // Literally just an extensible (and possibly operative) array utilizing `<allocator>`
import <async>;         // Utilities for asynchronous waiting, multi-threading, and parallelization (includes `<program>` for child threads, may include `<time>` for `sleep(…)` function)
import <bit>;           // Bitwise access/ mutations such as `bitsizeof(…)`; Does not support bit-level addressing
import <console>;       // (includes `<program>` for CLI/ stdout interaction)
import <file>;          // Utilities related to file I/O (includes `<url>`)
import <graphics>;      // Utilities related to graphics
import <graphics/font>; //
import <hardware>;      // Utilities related to a ton of hardware stuff
import <list>;          // Literally just a linked list
import <map>;           // Literally two `<array>`s with one being the key collection and the other the value collection
import <math>;          // Mathematical constants & functions
import <math/random>;   //
import <network>;       // Utilities related to networking
import <program>;       // Utilities related to the program such as its child threads, command-line arguments, execution path, memory usage(?), name, signals, suspension state, termination, …
import <queue>;         // Literally just an `<array>` that adds/ removes its elements in a First-In-First-Out order
import <set>;           // Literally a glorified `<array>` that enforces all its elements being unique
import <stack>;         // Literally just an `<array>` that adds/ removes its elements in a Last-In-First-Out order
import <time>;          // Utilities related to date localization, performance benchmarking, timestamps, …
import <url>;           // Utilities related to anything that uses a resource locator path
import <unicode>;       // Utilities related to text encodings

// …
namespace Storage {
  noscope enum type inherits uintmin noinherit nooperator {
    HEAP,   // Allocates memory on the program heap  if available (not compile-time supported)
    STATIC, // Allocates memory on the program stack if available
    STACK   // Allocates memory on the current stack frame; gets popped automatically through use of injected stack-frame pointer
  }
}

#constexpr function<Storage::type Storage = Storage::STACK> byte_buffer alloc    (const usize size);
#constexpr function<type          type>                     type        construct(auto ref... arguments, const addr storage = null); // `null` defers to `alloc<Storage::STACK>(sizeof type)` here
#constexpr function<type          type>                     auto        destruct (auto ref... arguments, type ref object) = typeof(object.#destructor(arguments...));
