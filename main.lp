APIs or Standards
• Asynchronicity
  ▴ Parallel: OpenMP, SIMD, …
  ▴ Wait
• Audio: WaveOut → Windows Audio Session (WASAPI) → XAudio2 → DirectSound → Audio Stream Input/ Output (ASIO)
  ╰─ 3GP `.3gp`, Audible AA `.aa` `.aax`, Advanced Audio Encoding `.aac`, …
• Font
  ╰─ TrueType `.ttf`, …
• Image: …
  ▴ Matrix
  │ ╰─ QR: …
  ╰─ APNG `.apng`, AVIF `.avif`, BMP `.bmp`, CR3 `.cr3`, GIF `.gif`, JPEG `.jpeg` `.jpg`, PNG `.png`, SVG `.svg`, WEBP `.webp`, …
• Mathematics
  ▴ Geometry
  ▴ Physics
  ▴ Random
  ▴ Timing
• Network: Windows Sockets 2 (winsock2) → Windows HTTP Services (winhttp) → Windows Internet (wininet)
  ╰─ TCP, UDP, …
• Serialization
• Source
• System
  ▴ Clipboard : …
  ▴ Console   : …
  ▴ Filesystem: …
    ╰─ …
  ▴ Hardware
    ▪ Battery    : …
    ▪ Biometrics : …
    ▪ Bluetooth  : …
    ▪ Camera     : …
    ▪ Controller : … (e.g. gamepads)
    ▪ Cooling    : …
    ▪ Disc Tray  : …
    ▪ Ethernet   : …
    ▪ Geolocation: …
    ▪ Haptic     : …
    ▪ Keyboard   : …
    ▪ Monitor    : …
      ⬟ Graphics: Vulkan → Direct3D 12 → Direct3D 11 → Direct3D 10 → Direct3D 9 → Direct3D 8 → OpenGL → Metal → Windows GDI → X11 → Quartz2D
    ▪ Mouse       : …
    ▪ NFC         : …
    ▪ Orientation : …
    ▪ Performance : …
    ▪ Processor(s): …
    ▪ Speaker     : …
    ▪ Storage     : …
    ▪ Stylus      : …
    ▪ Touchpad    : …
    ▪ Touchpen    : …
    ▪ Touchscreen : …
    ▪ USB         : …
    ▪ Wi-Fi       : …
  ▴ Object
    ▪ Array
    ▪ Error → Consider implementation support
    ▪ Function
    ▪ Integer → Extended and multi-precision integer support; Features to treat integral objects as integers e.g. `Integer::add(NULL, class {}) == Integer::add(0, …)`
    ▪ Memory
    ▪ Number → Representations only — to differentiate from Mathematics API
    ▪ Reflection
    ▪ String → Literals prefer source text encoding
      ⬟ Regular Expression literals
      ⬟ Rope
      ⬟ Small string optimization
    ▪ … → Non-literals; Consider Array-of-Structures vs Structure-of-Arrays implementation support
      ⬟ Linked List
      ⬟ Map
      ⬟ Queue
      ⬟ Set
      ⬟ Stack
      ⬟ Tuple
      ⬟ Variant
  ▴ Process: …
    ▪ Thread: …
• UI: …
  ▴ Desktop      : …
  ▴ Notifications: …
  ▴ Window       : …
• Video: …
  ╰─ MPEG-4 `.mp4`, …
• Web
  ▴ CSS
  ▴ HTML
  ▴ JavaScript
  ▴ WASM
• Time
  ▴ Date: …
  ▴ Greenwich Meridian

Constants
• Math::PHI → ϕ → φ → `real` that denotes the most precise representation for the golden ratio (not just `(1 + √5) ÷ 2`)
• Math::PI  → π     → `real` that denotes the most precise representation for Pi               (the Archimedes' constant)
• Math::TAU → τ     → `real` that denotes the most precise representation for Tau              (not just `2π`)
• NULL              → `addr` null object for pointers
• Γ(…)              → Monoadic function which denotes the factorial of `…`; See `https://en.wikipedia.org/wiki/Particular_values_of_the_gamma_function`
• Π(…)              → Variadic function which denotes all `…` multiplied; Alternatives (e.g. `π(…)`) ignored
• Σ(…)              → Variadic function which denotes all `…` summed;     Alternatives               ignored
• ∞                 → `real` that denotes the most minimal representation for Infinity
• ↉                 → `real` that denotes the most precise representation for zero-thirds
• ½                 → `real` that denotes the most precise representation for half
• ⅓                 → `real` that denotes the most precise representation for one-third
• ¼                 → `real` that denotes the most precise representation for one quarter
• ⅕                 → `real` that denotes the most precise representation for one-fifth
• ⅙                 → `real` that denotes the most precise representation for one-sixth
• ⅐                 → `real` that denotes the most precise representation for one-seventh
• ⅛                 → `real` that denotes the most precise representation for one-eighth
• ⅑                 → `real` that denotes the most precise representation for one-ninth
• ⅒                 → `real` that denotes the most precise representation for one-tenth
• ⅔                 → `real` that denotes the most precise representation for two-thirds
• ⅖                 → `real` that denotes the most precise representation for two-fifths
• ¾                 → `real` that denotes the most precise representation for three-quarter
• ⅗                 → `real` that denotes the most precise representation for three-fifths
• ⅜                 → `real` that denotes the most precise representation for three-eighths
• ⅘                 → `real` that denotes the most precise representation for four-fifths
• ⅚                 → `real` that denotes the most precise representation for five-sixths
• ⅞                 → `real` that denotes the most precise representation for seven-eighths

Evaluators
• addrof     [(] … [)] → Evaluates address of expression; Evaluates to `null` for `void` expressions or similar edge cases
• alignof    [(] … [)] → Evaluates `byte` alignment of expression/ type
• assert     [(] … [)] → Raises error if `(bool) …` is falsy
• instanceof [(] T [)] → Denotes object of type `T` in an unevaluated context
• nilof      [(] T [)] → Represents extensible monoadic function(s) which denote the null object of type `T`
• sizeof     [(] … [)] → Evaluates `byte` size of expression/ type
• typeof     [(] … [)] → Deduces    type       of expression/ type

Features
• Binary, hexadecimal, and octal number literals support scientific notation e.g. `0x1.2p-3 == 1.125 * (2 ** -3)`
• Deferred line termination i.e. automatic semi-colon insertion
• Hash symbol (`#`) connotes special constructs or operations e.g. access specifiers, constructors, …; Does not need its own entire line to be evaluated
• Keywords may be redefined as identifiers in certain contexts e.g. `function void function(auto function)`
• Multi-line comments support nested multi-line comments e.g. `non-comment /* comment /* comment */ */ non-comment`
• Properties or subobjects are padded strictly
• Niladic functions do not require parentheses to indicate parameters or structure
• Non-composite identifiers shall not include the hash symbol `#`
• REPL-agnostic support
• Single-line comments e.g. `non-comment // comment`
• Standard library uses `camelCase` and `PascalCase` formatting
• Source text encoding precedence: UTF-8 → UTF-16 LE → UTF-16 BE → UTF-32 → … → ASCII

Keywords
• Class/ Function Attributes
  ▴ #noignore   → Ensures return values are used
  ▴ #noinherits → Prevents class inheritance
  ▴ #nooperator → Prevents additional user-defined operator overloads on structure type i.e. `class` or `union`
  ▴ #noreturn   → Prevents function return                                              i.e. `ret` assembly instruction
  ▴ #nothrow …  → Prevents exception handling                                           i.e. optimizes against stack unwound errors

• Source Directives
  ▴ #embed …          → See `#import` for value specification; Substitutes the external source as-is into the code
  ▴ #error …          → Compile-time error
  ▴ #export [{] … [}] → Features must be explicitly exported for `#import`
  ▴ #import           → Does not eagerly fail if specified value is invalid (fails on mismatched type)
    ▪ #import "file" … "path"   → Determined by current working directory (absoluteness or relative-ness determined by filesystem, supports online URLs regardless)
    ▪ #import <standard-import> → Determined by compiler/ interpreter install directory
    ▪ #import … else …          → Conditional import e.g. `#import … else #error …`
  ▴ #warn … → Compile-time warning

• Special Functions
  ▴ #constructor(…)
  ▴ #get()
  ▴ #operator … e.g. `#operator +()`, `#operator +(…)`, `#operator +(…, …)`, `#operator T()`, `#operator "💙"(…)`
  ▴ #set(…)

• …
  ▴ #private   [{] … [}]
  ▴ #protected [{] … [}]
  ▴ #public    [{] … [}]

  ▴ and
  ▴ not
  ▴ or
  ▴ xor

Operators
• ‥                → Refers to preceding top-level objects (excludes members) in the current expression e.g. `‥ .member == ‥.member`
• ‥1               → Refers to first  top-level objects in the current expression e.g. `0 + ‥1 == 0`
• ‥2               → Refers to second top-level objects in the current expression e.g. `0 +  1 == ‥2`
• ‥1 then ‥2       → Evaluation precedence i.e. Guarantees evaluation of `‥1` before `‥2`
• ‥1 ? : ‥2        → `‥1 ? ‥1 : ‥2`
• ‥1 ? ‥2 :        → `‥1 ? ‥2 : ‥1`
• ‥n               → Refers to last        top-level objects in the current expression e.g. `0 + ‥n == 1`
• ‥n1              → Refers to penultimate top-level objects in the current expression e.g. `0 +  1 == ‥n1`
• |…|              → Absolution e.g. `|-2 - 3| == 5`
• … ≪        …     → Bitwise left  shift
• … ≪=       …     → Bitwise left  shift compound assignment
• … ≫        …     → Bitwise right shift
• … ≫=       …     → Bitwise right shift compound assignment
• … &&=      …     → Boolean AND compound assignment
• … ||=      …     → Boolean OR  compound assignment
• … ^^       …     → Boolean XOR
• … ^^=      …     → Boolean XOR compound assignment
• … ÷        …     → Division
• … =>   [{] … [}] → Function — necessary for Lambdas; Ignore `⇒` and `⟹` tokens
• … ≥        …     → Greater Equals
• … ≠        …     → Inequality
• … ≤        …     → Lesser Equals
• … mod      …     → Modulus
• … ×        …     → Multiplication
• … rem      …     → Remainder
• … ⇔        …     → Signed comparison
• … <=>      …     → Signed comparison
• … inherits …     → Structured inheritance
• … √        …     → …th Root
• 0o…              → Octal notation
• break    …       → Ends     `…`-labelled block
• continue …       → Iterates `…`-labelled block
• defer    …       → Ends current block and evaluates `…`
• delete   …       → `destruct<typeof …>(…)`
• do while …       → Formatted consistently like `else if …`
• if;              → `if true`
• if not;          → `if false`
• for;             → `for true`
• for …            → `for ( ; …; )`
• new T (…)        → `construct<T>(…, alloc<Storage::HEAP>(sizeof T))`
• while;           → `while true`
• @ …              → Derefences objects of type `addr`
• √ …              → Square Root
• ∛ …              → Cubed  Root
• ∜ …              → Fourth Root

Special Types
• #number → Source representation of number literals e.g. converts formats like `-.1e-0` (to `-0.1`) to `{.length = 2u, .precision = 1u, .signed = true, .value = {0u, 1u}}`
  ```lapys
  class #number #noinherits #nooperator {
    usize   length
    usize   precision
    bool    signed
    uint4[] value
  }
  ```

Type Aliases
• alias bit     =              …              → Individually occupies minimum of one `byte`, but prefers packing multiple on the same (stack) frame            (`unsigned` only)
• alias bool    =              bit[…]         → Differs from `byte` due to similar pack preference to `bit`                                                    (`unsigned` only)
• alias byte    =              bit[…]         → Smallest                     unit        for hardware storage, automatically packs `CHAR_BIT` number of `bit`s (`unsigned` only)
• alias iaddr   =              signed   uaddr → Signed `uaddr`               counterpart for signed   arithmetic
• alias int1    = alias i1   = signed   bit   → Signed `uint1`   (or `u1`)   counterpart for signed   arithmetic
• alias int2    = alias i2   = long     i1    → Signed `uint2`   (or `u2`)   counterpart for signed   arithmetic
• alias int4    = alias i4   = long     i2    → Signed `uint4`   (or `u4`)   counterpart for signed   arithmetic
• alias int8    = alias i8   = long     i4    → Signed `uint8`   (or `u8`)   counterpart for signed   arithmetic
• alias int16   = alias i16  = long     i8    → Signed `uint16`  (or `u16`)  counterpart for signed   arithmetic
• alias int32   = alias i32  = long     i16   → Signed `uint32`  (or `u32`)  counterpart for signed   arithmetic
• alias int64   = alias i64  = long     i32   → Signed `uint64`  (or `u64`)  counterpart for signed   arithmetic
• alias int128  = alias i128 = long     i64   → Signed `uint128` (or `u128`) counterpart for signed   arithmetic
• alias int256  = alias i256 = long     i128  → Signed `uint256` (or `u256`) counterpart for signed   arithmetic
• alias intmax  = alias imax = signed   …     → Signed `uintmax` (or `umax`) counterpart for signed   arithmetic
• alias intmin  = alias imin = signed   …     → Signed `uintmin` (or `umin`) counterpart for signed   arithmetic
• alias int     =              signed   uint  → Signed `uint`                counterpart for signed   arithmetic
• alias isize   =              signed   usize → Signed `usize`               counterpart for signed   arithmetic
• alias uint1   = alias u1   = unsigned bit   → 1-bit                        unit        for unsigned arithmetic
• alias uint2   = alias u2   = long     u1    → 2-bit                        unit        for unsigned arithmetic
• alias uint4   = alias u4   = long     u2    → 4-bit                        unit        for unsigned arithmetic
• alias uint8   = alias u8   = long     u4    → 8-bit                        octet       for unsigned arithmetic (and parity with most modern processors)
• alias uint16  = alias u16  = long     u8    → 16-bit                       unit        for unsigned arithmetic
• alias uint32  = alias u32  = long     u16   → 32-bit                       unit        for unsigned arithmetic
• alias uint64  = alias u64  = long     u32   → 64-bit                       unit        for unsigned arithmetic
• alias uint128 = alias u128 = long     u64   → 128-bit                      unit        for unsigned arithmetic
• alias uint256 = alias u256 = long     u128  → 256-bit                      unit        for unsigned arithmetic
• alias uaddr   =              bit[…]         → Largest                      unit        for pointer representations
• alias uint    =              bit[…]         → Default                      unit        for hardware instructions
• alias uintmax = alias umax = bit[…]         → Largest                      unit        for hardware instructions; Extending `uintmax` via the `long` qualification can be allowed through software emulation
• alias uintmin = alias umin = byte           → Smallest                     unit        for hardware instructions; `bit` and `bool` are the smallest `unsigned` types however
• alias usize   =              bit[…]         → Largest                      unit        for array bounds and size representations

Type Qualifications → Types are strictly to the left-hand side of property/ variable declarations
• First-level → Only applicable once on types
  ▴ long     T → Denotes an extended arithmetic type; Can not be used in conjunction with `short` qualification — `typeof(long  uint128) == typeof(uint128)`
  ▴ short    T → Denotes a       sub-arithmetic type; Can not be used in conjunction with `long`  qualification — `typeof(short uint1)   == typeof(uint1)`
  ▴ signed   T → Denotes an integer type as signed
  ▴ unsigned T → Denotes an integer type as non-signed

• Second-level → Only applicable once on types and third-level qualifications
  ▴ const      T → Parameters and variables are storage-constant by default
  ▴ function   T → Denotes a function
  ▴ generic<…> T → Denotes a (generic) template
  ▴ mutable    T → Parameters and variables can only instantiate modifiable memory through this qualification; Attempts to modify a `const`-instantiated object by spoofing `mutable` results in an error

• Third-level
  ▴ auto → Automatically deduce the type of an instantiation or return expression

  ▴ T addr → Interprets the object as a pointer to memory of type `T`
    ▪ `addr`      automatically deduces the type of its applied expression;                   `auto addr` is invalid syntax
    ▪ `void addr` denotes untyped pointers and shall not be traversed like byte pointers e.g. `byte addr`

  ▴ T ref → Interprets the object as an alias some other promised object of type `T`
    ▪ `ref`      may be second-level qualified (i.e. `T … ref`) regardless of the meaninglessness
    ▪ `ref`      automatically deduces the type of its applied expression;     `auto ref` is invalid syntax
    ▪ `void ref` denotes untyped references and has extremely limited use e.g. `sizeof((void ref) …) == 0`
    ▪ References can not be re-aliased to other promised objects

  ▴ T[] → Interprets the object as an unbounded array of objects of type `T`
    ▪ `T[]` may be second-level qualified (i.e. `T …[]`) regardless of the meaninglessness

  ▴ T[…] → Interprets the object as an bounded array of … objects of type `T`
    ▪ `T[…]` may be second-level qualified (i.e. `T …[…]`) regardless of the meaninglessness

Type Specifications
• alias … → Alias      type
• class … → Composite  type with methods and a namespace
• enum  … → Enumerable type with constant enumerators
• union … → Selective  type with methods and a namespace (and only one active property if available)

• static   T → Denotes static-allocated storage for variables
• threaded T → Denotes thread-local     storage for variables

…
```lapys
  class A    { class B {} }   // No `struct` keyword, but classes and unions are structure types
  class A::B {  }             /* Identifiers can composite scope operators `::` with other identifiers
                                   — `class A::B` runs into a naming conflict with `class B` defined within `class A` */
  generic<…> class A<…>::B {} // Assumes some `class A` is `generic` and declares `class A<…>::B`

  // Generics may be qualified onto `alias`, `class`, `function`, and `union` declarations only
  generic<usize width> class uintwidth #noinherits #nooperator {
    #private
      bit[width] value // Zero-sized subobjects do not contribute to the size of their object e.g. `bit[0]`

    #public
      #constructor(#number = 0u) { … } // `function` qualification is optional for `#constructor` and `#operator`

      uintwidth<width * 2u>                                #operator long   { … }
      uintwidth<width / 2u ? width / 2u : width ? 1u : 0u> #operator short  { … }
      intwidth <width>                                     #operator signed { … }

    /* … */
  }

  generic <usize width>
  class intwidth #noinherits #nooperator {
    // `class` and `union` types are `#public` access by default
    bit                              sign
    uintwidth<width - (0u != width)> value

    uintwidth<width> #operator unsigned { … }
    /* … */
  }

  /* Additional base types (and aliases) */
  generic <type base, usize capacity>
  class array<base, capacity> #nooperator {
    #public
      usize length {
        #get => default
        #set(usize value, mutable array addr object) { if (@object.resize(value)) @this = value }
      }

    #private
      union {
        base[capacity] automatic
        base addr      dynamic
      }

    /* … */
    #public
      #constructor(base...) { … }

      function usize push  (base...) { … }
      function bool  resize(usize)   { … }

      explicit #operator base addr      { … }
      #operator          base[capacity] { … }
  }

  generic <usize significance, usize place>
  class floatwidth #noinherits #nooperator {
    static usize place        = place
    static usize significance = significance

    #private
      bit               sign
      bit[significance] exponent
      bit[place]        mantissa

    #public
      #constructor(#number = 0.0f) { … }
      #operator uintwidth<place + significance + 1u> { … }

      /* … */
  }

  generic <type base>
  class iterator {
    function base addr begin { … }
    function base addr end   { … }
  }

  generic <type base>
  class span #nooperator {
    #public  usize     length
    #private base addr value

    /* … */
    #public
      #operator base addr { … }
  }

  class enum string::encoding inherits uintwidth<10zu> #nooperator {
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

  generic <usize capacity = 0u, string::encoding encoding = string::encoding::UTF_8> // Encoded UTF-8 by default but defers to the source text encoding
  class string #nooperator {
    static string::encoding encoding = encoding

    #private
      // Consider ropes --- CITE (Lapys) -> https://en.wikipedia.org/wiki/Rope_(data_structure)
      array<char, capacity> value

    #public
      #constructor(char[])  { … }
      #constructor(char...) { … }

      explicit #operator char addr             { … }
      #operator          char       [capacity] { … }
      #operator          array<char, capacity> { … }
  }

  class bigfloat #noinherits #nooperator
  class bigint   #noinherits #nooperator
  class biguint  #noinherits #nooperator
  class real     #noinherits #nooperator

  alias bfloat16 = alias bf16 = …
  alias char8    =              uint8
  alias char16   =              uint16
  alias char32   =              uint32
  alias float    =              …
  alias float8   = alias f8   = floatwidth<4zu,  3zu>   // CITE (Lapys) -> https://en.wikipedia.org/wiki/Minifloat
  alias float16  = alias f16  = floatwidth<5zu,  10zu>  // CITE (Lapys) -> https://en.wikipedia.org/wiki/Half-precision_floating-point_format
  alias float32  = alias f32  = floatwidth<8zu,  23zu>  // CITE (Lapys) -> https://en.wikipedia.org/wiki/Single-precision_floating-point_format
  alias float64  = alias f64  = floatwidth<11zu, 52zu>  // CITE (Lapys) -> https://en.wikipedia.org/wiki/Double-precision_floating-point_format
  alias float80  = alias f80  = floatwidth<15zu, 64zu>  // CITE (Lapys) -> https://en.wikipedia.org/wiki/Extended_precision
  alias float128 = alias f128 = floatwidth<15zu, 112zu> // CITE (Lapys) -> https://en.wikipedia.org/wiki/Quadruple-precision_floating-point_format
  alias float256 = alias f256 = floatwidth<19zu, 236zu> // CITE (Lapys) -> https://en.wikipedia.org/wiki/Octuple-precision_floating-point_format

  /* … */
  function auto double(auto n) { return n × 2 }
  function auto double(auto n) =>       n × 2
  (auto n)                     =>       n × 2
  (n)                          =>       n × 2
  n                            =>       n × 2
  $1 × 2

  namespace Storage {
    enum Type inherits uintmin #nooperator {
      AUTO,
      DYNAMIC,
      GLOBAL
    }

    generic<Storage::Type = Storage::AUTO> function span<byte>                                        alloc    (usize)                               { … }
    generic<type>                          function type addr                                         construct(auto...,           type addr = NULL) { … }
    generic<type>                          function typeof(instanceof type.#destructor(arguments...)) destruct (auto... arguments, type addr = NULL) { … }
  }

  using object {
    .property // object.property
  }
```
