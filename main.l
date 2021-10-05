alias bit:1b;
alias bool = bit;
alias byte:1;
alias char:1;
alias int8  :signed 8;
alias int16 :signed 16;
alias int32 :signed 32;
alias int64 :signed 64;
alias int128:signed 128;
alias int = int32;
alias uint8  :unsigned 8;
alias uint16 :unsigned 16;
alias uint32 :unsigned 32;
alias uint64 :unsigned 64;
alias uint128:unsigned 128;
alias uint = int32;

// `long`  doubles   the size by two  (effects members)
// `short` truncates the size by half (effects members)
// `signed`   enforces compile-time checks (defaults to `int`)
// `unsigned` enforces compile-time checks (defaults to `int`)

struct float {
  var sign:1;
  var characteristics:23;
  var mantissa:8;

  @constructor(float);
  float& @operator =(float);
  // ... and others
};

struct string {
  public char[] value;
  private { char *end; }

  // ...
  @constructor(char[] value) : value{value} {}
  @constructor(char*  value, unsigned length) : value{value}, end{value + length} {}
  @constructor(char[] value, unsigned length) : value{value}, end{&value[length]} {}

  // ...
  static string& concat(string&);
  static string concat(string&, string&);

  get unsigned length() { return end - value; }
  char& @operator [](signed index) { return this.value[index]; }
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

"Foo bar baz".length; // by default a `string` \
                         unless initialized as `char[]`, or `char*`
char*("Foo bar baz");
char[]("Foo bar baz");
char[13]("Foo bar baz");
char[13]:8("Foo bar baz"); // truncated
