#constexpr function<usize length> byte[length] string_transform(const byte[length] ref string) {
  #constexpr byte transformer(const byte character) {
    // ... ->> Presume ASCII format; `string`s may also be manipulated as such
    if (character >= 'A' and character <= 'Z') return 'a' + (character - 'A');
    if (character >= 'a' and character <= 'z') return 'A' + (character - 'a');
    if (character >= '0' and character <= '8') return character + 1;
    if (character == '9')                      return '0';

    return character;
  }

  return {transformer(string)...};
}

/* Main */
#constexpr void #main() {
  const byte[] string = "Hello, 981!";
  assert(string::compare("hELLO, 092!", string_transform(string)));
}
