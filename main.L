Hot-reloading live Abstract Syntax Tree previewer

APIs or Standards
• Asynchronicity
  ▴ Parallel: OpenMP, SIMD, …
  ▴ Wait
• Audio: WaveOut → Windows Audio Session (WASAPI) → XAudio2 → DirectSound → Audio Stream Input/ Output (ASIO); ReplayGain to normalize volume levels between different encodings
  ├─ Advanced Audio Coding                             `.aac`
  ├─ Apple Lossless Audio Codec                        `.alac`
  ├─ Audible AA                                        `.aa`,   `.aax`
  ├─ Audio Interchange File Format                     `.aif`, `.aifc`, `.aiff`
  ├─ Direct Stream Digital Audio                       `.dsf`
  ├─ Free Lossless Audio Codec (FLAC)                  `.flac` ✅
  ├─ Fasttracker, Protracker                           `.mod`
  ├─ Fasttracker 2                                     `.xm`
  ├─ IETF Opus                                         `.opus`
  ├─ Impulse Tracker                                   `.it`
  ├─ Matroska Video (MKV)                              `.mk3d`, `.mka`, `.mks`, `.mkv`
  ├─ Monkey’s Audio                                    `.ape`
  ├─ Moving Picture Experts Group (MPEG)               `.dat`,  `.m1a`, `.m1v`, `.m2a`,  `.mp1`, `.mp2`, `.mp3`, `.mpa`, `.mpeg`, `.mpg`, `.mpv`
  ├─ MPEG-1 Audio Layer 1         (MP1)                `.mp1`
  ├─ MPEG-1 Audio Layer 2         (MP2)                `.mp2`
  ├─ MPEG-1 Audio Layer 3         (MP3)                `.bit`, `.mp3`
  ├─ MPEG-4 Part 14               (MP4)                `.m4a`, `.m4b`,  `.m4p`, `.m4r`,  `.m4v`, `.mp4`
  ├─ Musepack                                          `.mpc`
  ├─ Musical Instrument Digital Interface (MIDI)       `.mid`
  ├─ Ogg Vorbis                                        `.oga`, `.ogg`,  `.ogm`, `.opus`, `.ogv`, `.ogx`, `.spx`
  ├─ OptimFROG                                         `.ofr`, `.ofs`
  ├─ PlayStation Volume Audio Generation (VAG)         `.vag`
  ├─ ScreamTracker 3                                   `.s3m`
  ├─ Speex                                             `.spx`
  ├─ Third Generation Partnership Project (3G2/ 3GPP2) `.3g2`, `.3gp2`, `.3gpp2`
  ├─ Third Generation Partnership Project (3GP/ 3GPP)  `.3gp`, `.3gpp`
  ├─ Tom’s Audio Kompressor                            `.tak`
  ├─ True Audio                                        `.tta`
  ├─ Windows Media Audio                               `.wma`
  ├─ WavPack                                           `.wv`
  ├─ Waveform Audio (WAV)                              `.wav`, `.wave`
  ╰─ Web Media      (WEBM)                             `.webm`
• Error: Consider implementation support – Errors are unique string-like objects without manipulation operations
• Font
  ╰─ TrueType `.ttf`, … ✅
• Graphics
  ├─ Kawase Blur → Gaussian Blur
  ╰─ Rotation (interchangeable between, no default, only preference): Rotors (https://marctenbosch.com/quaternions) → Quaternions → Spinors → Axis/ Euler Angles
• Image: …
  ▴ Matrix
  │ ├─ 2D    : Australia Post, Codablock, Code 49, Code 16K, DX film edge, Intelligent Mail, KarTrak ACI, PostBar, POSTNET, RM4SCC/ KIX, RM Mailmark C, RM Mailmark L, Spotify
  │ ├─ Linear: Codabar, Code 11, Code 25, Code 32 (Farmacode), Code 39, Code 93, Code 128, CPC Binary, Data Logic 2 of 5, EAN 2, EAN 5, EAN-8, EAN-13, Facing Identification Mark, GS1-128 (EAN-128/ UCC), GS1 DataBar, IATA 2 of 5, Industrial 2 of 5, ITF-6, ITF-14, JAN, Japan Post, Matrix 2 of 5, MSI, Pharmacode, PLANET, Plessey, Telepen, UPC-A/ UPC-E (Universal Product Code)
  │ ╰─ Matrix: App Clip, AR, Aztec, bCode, BEEtag, BeeTagg, Bokode, Boxing, Cauzin Softstrip, Code 1, ColorCode, Color Construct Code, Cronto Visual Cryptogram, CyberCode, d-touch, DataGlyphs, Data Matrix, Datastrip Code, Digimarc Code, digital paper, Dolby Digital, Dot Code, DWCode, EZcode, Han Xin code, High Capacity Color Barcode, JAB Code, MaxiCode, Micro QR, Micro PDF417, MMCC, Nintendo Dot code, PDF417, ShotCode, Snapcode, SPARQCode
  │    ╰─ QR (Quick Response)
  │       ├─ Accessible QR (AQR)
  │       ├─ Frame QR
  │       ├─ High-Capacity Colored 2-Dimensional … (HCC2D)
  │       ├─ iQR
  │       ├─ Micro QR (Rectangular)
  │       ├─ Model 1
  │       ├─ Model 2 ✅
  │       ├─ Rectangular Micro QR (rMQR)
  │       ╰─ Secret-function-equipped QR code (SQRC)
  ├─ Animated PNG          (APNG)                              `.apng`
  ├─ AV1 Image File Format (AVIF)                              `.avif`
  ├─ Computer Graphics Metafile                                `.cgm`
  ├─ Canon Raw v3                                              `.cr3`
  ├─ Gerber                                                    `.gbr`
  ├─ Graphics Interchange Format       (GIF) by CompuServe     `.gif`
  ├─ High-Efficiency Image File Format (HEIF)                  `.avci`, `.avcs`, `.avif`, `.heic`, `.heics`, `.heif`, `.heifs`, `.HIF`
  ├─ Icon                              (ICO)                   `.icl`,  `.ico`
  ├─ Joint Photographic Experts Group  (JFIF/ JPEG)            `.jfi`,  `.jfif`, `.jif`, `.jpe`, `.jpeg`, `.jpg`
  ├─ JPEG 2000                                                 `.j2c`,  `.j2k`,  `.jp2`, `.jpc`, `.jpf`,  `.jpg2`, `.jpm`, `.jpx`, `.mj2`
  ├─ JPEG Extended Long-Term   (JPEG XL)                       `.jxl`
  ├─ JPEG Extended Range       (JPEG XR)                       `.hdp`, `.jxr`, `.wdp`
  ├─ Portable Bit     Map      (PBM)                           `.pbm`, `.pnm`
  ├─ Portable Gray    Map      (PGM)                           `.pgm`, `.pnm`
  ├─ Portable Network Graphics (PNG)                           `.png` ✅
  ├─ Portable Pixel   Map      (PPM)                           `.pnm`, `.ppm`
  ├─ Radiance HDR              (RGBE/ Red Green Blue Exponent) `.hdr`
  ├─ Scalable Vector Graphics  (SVG)                           `.svg`
  ├─ Tagged Image File Format  (TIFF)                          `.tif`, `.tiff`
  ├─ Tiny Vector Graphics      (TinyVG)                        `.tvg`
  ├─ Weppy File Format         (WebP)                          `.webp`
  ├─ Windows Bitmap                                            `.bmp`, `.dib`, `.rle`
  ├─ Windows Cursor                                            `.cur`
  ├─ X Bitmap (XBM)                                            `.xbm`
  ╰─ X PixMap (XPM)                                            `.xpm`
• Mathematics
  ▴ Geometry
    ├─ Extensible 3D (X3D) `.x3d` `.x3db` `.x3dbz` `.x3dvz` `.x3dv` `.x3dz`, …
    ╰─ Filmbox       (FBX) `.fbx`
    ╰─ Object        (OBJ) `.obj` ✅
  ▴ Physics
  ▴ Random
    ╰─ Cryptographic algorithms, Hardware randomizers e.g. atmospheric pressure
  ▴ Timing
• Network: Windows Sockets 2 (winsock2) → Windows HTTP Services (winhttp) → Windows Internet (wininet)
  ├─ Open Systems Interconnection (https://en.wikipedia.org/wiki/OSI_model)
  ╰─ TCP (https://blog.netherlabs.nl/articles/2009/01/18/the-ultimate-so_linger-page-or-why-is-my-tcp-not-reliable), UDP, …
• Serialization
• Source
• System
  ▴ Clipboard : …
  ▴ Console   : …
  ▴ Filesystem: …
    ├─ When scanning NTFS formatted hard drives, read the Master File Table (MFT) directly from disk. A special hidden file that tracks all file/ folders on a hard drive.
    ╰─ … in-memory files; on-disk files; network files
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
  ▴ Object → Entity-Component-System’d e.g. `String::buffers`, `String::lengths`; `OnAdd` event?
    ▪ Array → `reverse` flag
      ⬟ LinkedList
      ⬟ ObservableArray
      ⬟ SortedArray
    ▪ Function
    ▪ Integer → Extended and multi-precision integer support; Features to treat integral objects as integers e.g. `Integer::add(NULL, class {}) == Integer::add(0, …)`
    ▪ Map     → C# dictionary, Java hashmap, Lua table
      ⬟ SortedMap
    ▪ Memory
    ▪ Number → Representations only — to differentiate from Mathematics API
      ⬟ Integers            (-∞, +∞): Two’s Complement
      ⬟ Reals               (-∞, +∞): Posits (https://posithub.org) (https://hal.science/hal-03195756/file/2021_Posit_IEEE754_Hardware_Cost.pdf) → Floating-Point (https://ieeexplore.ieee.org/document/8766229)
      ⬟ Unit-Interval Reals (-1, +1): Takum (https://link.springer.com/chapter/10.1007/978-3-031-72709-2_1)
    ▪ Reflection
    ▪ String → Literals prefer source text encoding
      ⬟ Regular Expression literals
      ⬟ Rope
      ⬟ Small string optimization
    ▪ … → Non-literals; Consider Array-of-Structures vs Structure-of-Arrays implementation support
      ⬟ Enumerable
      ⬟ Queue
      ⬟ Set
      ⬟ Span
      ⬟ Stack
      ⬟ Tuple → Supports other types decomposing into them (provided the layout is compatible) e.g. `class A { int; int; }` → `(int, int)`
      ⬟ Variant
  ▴ Process: …
    ▪ Thread: …
• Time
  ▴ Date: …
  ▴ Apollo Time
  ▴ Greenwich Meridian
• UI: …
  ▴ Desktop      : …
  ▴ Notifications: …
  ▴ Window       : …
• Video: …
  ├─ Audible AA                                        `.aa`, `.aax`
  ├─ Advanced Audio Encoding                           `.aac`
  ├─ Audio Video Interleave (AVI)                      `.avi`
  ├─ M4V                                               `.m4v`
  ├─ Matroska Video               (MKV)                `.mk3d`, `.mka`, `.mks`, `.mkv`
  ├─ Movie/ QuickTime File Format (MOV/ QTFF)          `.mov`,  `.qt`
  ├─ Moving Picture Experts Group (MPEG)               `.dat`,  `.m1a`, `.m1v`, `.m2a`, `.mp1`, `.mp2`, `.mp3`, `.mpa`, `.mpeg`, `.mpg`, `.mpv`
  ├─ MPEG-2 Transport Stream      (M2TS)               `.mt2s`, `.MTS`
  ├─ MPEG-4 Part 14               (MP4)                `.m4a`,  `.m4b`, `.m4p`, `.m4r`, `.m4v`, `.mp4` ✅
  ├─ Multiple Network Graphics    (MNG)                `.mng`
  ├─ Ogg Vorbis                                        `.oga`, `.ogg`,  `.ogm`, `.opus`, `.ogv`, `.ogx`, `.spx`
  ├─ Third Generation Partnership Project (3G2/ 3GPP2) `.3g2`, `.3gp2`, `.3gpp2`
  ├─ Third Generation Partnership Project (3GP/ 3GPP)  `.3gp`, `.3gpp`
  ├─ Video Object                         (VOB)        `.vob`
  ╰─ Web Media                            (WEBM)       `.webm`
• Web
  ▴ CSS
  ▴ HTML
  ▴ JavaScript
  ▴ WASM

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

Diagnostic
[Error]: …/main.ll:113:34:b156: Expected '}', but got '{'!
┌─────┐ // only if start-of-file
│ ... │
│ 113 │ func fib(n: int): int = if n < 2 {
│ 114 │     foo { a = 1, b = 2 };
│ 115 │     n
│ ... │
└─────┘ // only if end-of-file
[Note]: Maybe a missing semicolon?

Evaluators
• addrof     [(] … [)] → Evaluates address of expression; Evaluates to `null` for `void` expressions or similar edge cases
• alignof    [(] … [)] → Evaluates `byte` alignment of expression/ type
• assert     [(] … [)] → Raises error if `(bool) …` is falsy
• instanceof [(] T [)] → Denotes object of type `T` in an unevaluated context
• nilof      [(] T [)] → Represents extensible monoadic function(s) which denote the null object of type `T`
• sizeof     [(] … [)] → Evaluates `byte` size of expression/ type; Works on `#nooptimize` functions but otherwise prefer `Function::…(…)`
• typeof     [(] … [)] → Deduces    type       of expression/ type

Features
• Allows unique quotes for character and strings constant literals e.g. `‘H’`, `“Hello, World!”`, `「L」`, `『Lorem ipsum』`, e.t.c.
• Apollo Time as the base time format
• Binary, hexadecimal, and octal number literals support scientific notation e.g. `0x1.2p-3 == 1.125 * (2 ** -3)`
• Conditional members
• Deferred line termination i.e. automatic semi-colon insertion
• Errors should be colored and formatted as `file_name:file_extension:line_number:character_byte_offset`
• Function/ type/ value metadata e.g. "never odd" constraint, e.t.c. to allow compiler optimize non-generic constraints like `const`
• Hash symbol (`#`) connotes special constructs or operations e.g. access specifiers, constructors, …; Does not need its own entire line to be evaluated
• Keywords may be used as identifiers in certain contexts e.g. `function void function(auto function)`
• Meta-compilation (Compile-time expressions (with source I/O) within compile-time expressions to dynamically build source i.e. “self-modifying” source)
• Meta-programming
• Multi-line comments support nested multi-line comments e.g. `non_comment /* comment /* comment */ // comment */ non_comment`
• Niladic functions do not require parentheses to indicate parameters or structure
• No Entry/ Main function, rather it’s a `#main` block
• Properties or subobjects are padded strictly
• REPL-agnostic support
• Single-line comments e.g. `non_comment // comment`
• Standard library uses `camelCase` and `PascalCase` formatting
• Source text encoding precedence: UTF-8 → UTF-16 [NE] → UTF-16 LE → UTF-16 BE → UTF-32 → … → US-ASCII
• Swizzling → Must specify properties that can be swizzled e.g. `.x` and `.y` can be accessed via `.xy = class {T, T}`

Keywords
• Attributes
  ▴ #noignore   → Ensures return values are used
  ▴ #noinherits → Prevents class inheritance
  ▴ #nooperator → Prevents additional user-defined operator overloads on plex type i.e. `class` or `union`
  ▴ #noreturn   → Prevents function return                                         i.e. `ret` assembly instruction
  ▴ #nothrow …  → Prevents exception handling                                      i.e. optimizes against stack unwound errors

• Constructs
  ▴ #class       → Aliases currently-scoped class type
  ▴ #constructor → Declares factory function for instantiating objects
  ▴ #destructor  → Declares cleanup function for destroying objects
  ▴ #get()       → …
  ▴ #main        → Evaluate block line-by-line
  ▴ #operator    → Declares special function for overriding default operator behaviour e.g. `#operator +()`, `#operator +(…)`, `#operator +(…, …)`, `#operator false|true()`, `#operator T()`, `#operator bool()`, `#operator "💙"(…)`
  ▴ #private     → Declares properties as accessible only within its class' (not derived class') scope
  ▴ #protected   → Declares properties as accessible only within its class' (and derived class') scope
  ▴ #public      → Declares properties as accessible i.e. `#public …` or `#public { … }`
  ▴ #set(…)      → …
  ▴ #this        → Aliases class object instance — method may not internally use self-pointer if keyword is not used

• Source Directives
  ▴ #embed …          → See `#import` for value specification; Substitutes the external source as-is into the code
  ▴ #error …          → Compile-time error
  ▴ #export [{] … [}] → Features must be explicitly exported for `#import`
  ▴ #import           → Does not eagerly fail if specified value is invalid (fails on mismatched type)
    ▪ #import "file" … "path"   → Determined by current working directory (absoluteness or relative-ness determined by filesystem, supports online URLs regardless)
    ▪ #import <standard-import> → Determined by compiler/ interpreter install directory
    ▪ #import … else …          → Conditional import e.g. `#import … else #error …`
  ▴ #warn … → Compile-time warning

• …
  ▴ and   → Logical conjunctive boolean
  ▴ has   → Direct comparison or exclusively indexed assertion
  ▴ is a  → Type inference
  ▴ is an → Type inference
  ▴ not   → Logical negation
  ▴ or    → Logical disjunctive boolean
  ▴ reset → Restarts a (ranged) `for` loop
  ▴ smth  → The perennial `auto` or `var`
  ▴ with  → Scope chain extender (if it works for member functions, it can work explicitly for control flow constructs)
  ▴ xor   → Logical bi-conditional boolean

Operators
• ‥                → Refers to preceding top-level objects (excludes members) in the current expression e.g. `‥ .member == ‥.member`
• ‥1               → Refers to first  top-level objects in the current expression e.g. `0 + ‥1 == 0`
• ‥2               → Refers to second top-level objects in the current expression e.g. `0 +  1 == ‥2`
• ‥1 then ‥2       → Evaluation precedence i.e. Guarantees evaluation of `‥1` before `‥2`
• ‥1 ? : ‥2        → `‥1 ? ‥1 : ‥2`
• ‥1 ? ‥2 :        → `‥1 ? ‥2 : ‥1`
• ‥n               → Refers to last        top-level objects in the current expression e.g. `0 + ‥n == 1`
• ‥n1              → Refers to penultimate top-level objects in the current expression e.g. `0 +  1 == ‥n1`
• 1 ‥ 2            → Range operation
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
• ???              → Subnormal coalescence; Coerces subnormal `real` values into specified alternatives similarly to nullish-coalescence or short-circuiting
• 0o…              → Octal notation
• break    …       → Ends     `…`-labelled block or next-chained `…` statement e.g. `break    if`
• continue …       → Iterates `…`-labelled block or next-chained `…` statement e.g. `continue for`
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

Optimizations
• Align conditionals                → If data types are padded for performant/ valid access, then so are conditionals
• Align functions                   → If data types are padded for performant/ valid access, then so are functions
• Align labels                      → If data types are padded for performant/ valid access, then so are labels
• Align loops                       → If data types are padded for performant/ valid access, then so are loops
• Branch-less conditionals          → For example, optimize `if (…) x = 0` to `x = x * !…`
• Code hoisting                     → Expressions executed on all paths are hoisted to the function exit as early as possible
• Common Sub-expression Elimination → See `https://en.wikipedia.org/wiki/Common_subexpression_elimination`
• Cyclic Redundancy Checks          → Loops calculating CRC (via polynomial long division) get optimized
• Dead-Code Elimination             → See `https://en.wikipedia.org/wiki/Dead-code_elimination`
• Dead-Store Elimination            → See `https://en.wikipedia.org/wiki/Dead_store`
• Finite floating-points            → Assumes floating-point arithmetic doesn't evaluate infinities or NaNs
• Floating-point to string          → See `https://dl.acm.org/doi/epdf/10.1145/3296979.3192369`
• Function inlining                 → Avoid cost of function calls; Especially done with immediately-invoked, single-invoked, or smaller functions e.g. `Enumerable::foreach(…)`, `x => x + 2`, e.t.c.
• Gauss sum                         → `for … i += 1 ‥ n`; See `https://en.wikipedia.org/wiki/Gauss_sum`
• Loop commoning                    → Re-use iteration computation
• Loop distribution/ split          → Optimistically segment loops into possibly vector-izable blocks e.g. `for (…) { x[i] = 1; y[i] = x[i] + i }` to `Memory::memset(x, …, 1); for (…) y[i] = 1 + i`
• Loop unroll                       → Depends on environment speed of unrolled compared to loop e.g. `for (i ‥ 4) x[i] = i` to `x[0] = 0; …; x[3] = 3`
• Merge constants                   — `"…"` and `"…"` are indistinct constant values that now occupy the same memory
• Non-signed reals                  → Assumes real arithmetic doesn't evaluate negative zeroes
• Non-trapped floating-points       → Assumes floating-point arithmetic doesn't invoke floating-point exceptions or signaling NaNs
• Prune unused values               —
• Reciprocal reals                  → For example, optimize `x / y` to `x * (1 / y)` if `y` can be folded
• Recursive Tail and Sibling Calls  —
• Sole executable                   → Source represents entire compile unit
• String comparisons                → For example, optimize `x.lower() == y.lower()` to `string::equals(x, y, string::ignore_case)`
• String lengths                    —
• Swing Modulo Scheduling           — Re-ordering loop iterations; See `https://llvm.org/pubs/2005-06-17-LattnerMSThesis.pdf`
• Vectorized arithmetic             → Single-Instruction, Multiple-Data (SIMD) if supported
• Vendor-specific                   → For example, omit function frame pointer, prefer "decrement and branch" instructions over sequenced alternatives, use Block Starting Symbol (`.bss`) section, …, e.t.c.

Provenance
• `(50 + (uintptr) 2) / 3` is internalized as `({NULL, false, 5} + {…, true, 2})` and results in `{(… + 50) / 3, true, 17.33…32}` internally

Special Types
• #number → Source representation of number literals e.g. converts formats like `-.1e-0` (to `-0.1`) to `{.length = 2u, .precision = 1u, .signed = true, .value = {0u, 1u}}`
  ```langlang
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

• Second-level → Only applicable once on types and third-level qualifications (propagates through all levels of T)
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
```langlang
This is probably just a dumb vibe: field/ variable overloading```py
// different objects & types
struct { int a; } x = {1};
struct { int b; } x = {2};``````js
print(x);   // ❌ compile error: which one?
print(x.a); // ✅ 1
print(x.b); // ✅ 2```
```

```langlang
  class A    { class B {} } // No `struct` keyword, but classes and unions are plex types
  class A::B {  }           // Identifiers can composite scope operators `::` with other identifiers; `class A::B` runs into a naming conflict with `class B` defined within `class A`
  generic<…> class A<…>::B {}

  class B :        C    {}
  class B : static C    {} // Internal `C` singleton
  class B : static C*   {}
  class B : static C(…) {}

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
    us_dk,    csUSDK         = us_dk,
    UTF_16,   csUTF16        = UTF_16,
    UTF_16BE, csUTF16BE      = UTF_16BE,
    UTF_16LE, csUTF16LE      = UTF_16LE,
    UTF_32,   csUTF32        = UTF_32,
    UTF_32BE, csUTF32BE      = UTF_32BE,
    UTF_32LE, csUTF32LE      = UTF_32LE,
    UTF_7,    csUTF7         = UTF_7,
    UTF_8,    csUTF8         = UTF_8,
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
  alias fixed    =              …
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

    /* … */
    generic <Storage::Type = Storage::AUTO>
    function span<byte> alloc(usize) { … }

    generic <type>
    function type addr construct(auto..., type addr = NULL) { … }

    generic <type>
    function typeof(instanceof type.#destructor(arguments...)) destruct(auto... arguments, type addr = NULL) { … }
  }

  using object {
    .property // object.property
  }
```
