alias binary1  :1;
alias binary2  :2;
alias binary4  :4;
alias binary8  :8;
alias binary16 :16;
alias binary32 :32;
alias binary64 :64;
alias binary128:128;
alias bit:1;

alias bool    = binary1;
alias byte    = bit;
alias char    = binary1;
alias int     = binary32;
alias int8    = signed binary8;
alias int16   = signed binary16;
alias int32   = signed binary32;
alias int64   = signed binary64;
alias int128  = signed binary128;
alias uint8   = unsigned binary8;
alias uint16  = unsigned binary16;
alias uint32  = unsigned binary32;
alias uint64  = unsigned binary64;
alias uint128 = unsigned binary128;
alias size_t  = unsigned;
alias ssize_t = signed;
// `long`  doubles   the size by two  (effects members)
// `short` truncates the size by half (effects members)
// `signed`   enforces compile-time checks (defaults to `int`)
// `unsigned` enforces compile-time checks (defaults to `int`)

struct float {
  var sign:1;
  var characteristics:23;
  var mantissa:8;

  [constructor](float);
  float& [operator =](float);
  // ... and others
};

struct string {
  public char[] value;
  private { char *end; }

  // ...
  [constructor](char[] value) : value{value} {}
  [constructor](char*  value, size_t length) : value{value}, end{value + length} {}
  [constructor](char[] value, size_t length) : value{value}, end{&value[length]} {}

  // ...
  static string& concat(string&);
  static string concat(string&, string&);

  get size_t length() { return end - value; }
  char& [operator []](ssize_t index) { return this.value[index]; }
};

/* ... */
class Object {};
class A extends Object {};
class B extends Object:2 {};

// ...
var explicit:4;

Object object:4; // padded
var inferred = object; // Object:4&
Object:4 *pointer = &object;
Object:4 &reference = object;
Object:4[2] array = {object, Object:4()}; // array of references to `Object:4`
Object:4[2] truncated:3 = array;
Object:4[2] &reference = array;

char     *text    = "Hello, World!";
char[13] *text    = &"Hello, World!";
char[13] &text    = "Hello, World!";
char[]    text    = "Hello, World!"; // asserts as `13` `char`s
char[13]  text    = "Hello, World!";
char[13]  text:13 = "Hello, World!";
string text    = "Lorem ipsum";
string text:11 = "Lorem ipsum";                                 // truncates the `end` member
string text:sizeof string - sizeof char* = "Lorem ipsum";       // truncates the `end` member
string text:sizeof string - sizeof string::end = "Lorem ipsum"; // truncates the `end` member

"Foo bar baz".length; // by default a `string` unless initialized as `char[]`, or `char*`
char*("Foo bar baz");
char[]("Foo bar baz");
char[13]("Foo bar baz");
char[13]:8("Foo bar baz"); // truncated
