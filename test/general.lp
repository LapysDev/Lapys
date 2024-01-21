#constexpr byte[] transform(const byte[] ref string) {
  return {(character => byte {
    // ... ->> Presume ASCII format; `string`s may also be manipulated as such
    if (character >= 'A' and character <= 'Z') return 'a' + (character - 'A')
    if (character >= 'a' and character <= 'z') return 'A' + (character - 'a')
    if (character >= '0' and character <= '8') return ++character
    if (character == '9')                      return '0'

    return character
  })(string)...}
}

/* Main */
#constexpr void #main() {
  assert(transform("Hello, 981!") == "hELLO, 092!" as byte[], "Oh, crumbs! 🍪");
}
