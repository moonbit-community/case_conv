///|
/// Parse UpperCamelCase (PascalCase) string into Words
/// Example: "HelloWorldTest" -> Words(["hello", "world", "test"])
pub fn Words::from_upper_camel(input : String) -> Words {
  if input.is_empty() {
    return Words([])
  }
  let words : Array[String] = []
  let current_word : Array[Char] = []
  for char in input {
    // Check if char is uppercase by comparing with its lowercase version
    if char >= 'A' && char <= 'Z' && current_word.length() > 0 {
      // Start new word on uppercase letter (except first char)
      words.push(String::from_array(current_word).to_lower())
      current_word.clear()
    }
    current_word.push(char)
  }

  // Add final word if any
  if current_word.length() > 0 {
    words.push(String::from_array(current_word).to_lower())
  }
  Words(FixedArray::from_array(words))
}

///|
/// Parse lowerCamelCase string into Words
/// Example: "helloWorldTest" -> Words(["hello", "world", "test"])
pub fn Words::from_lower_camel(input : String) -> Words {
  // Same logic as UpperCamel since we split on uppercase letters
  Words::from_upper_camel(input)
}

///|
/// Parse snake_case string into Words
/// Example: "hello_world_test" -> Words(["hello", "world", "test"])
pub fn Words::from_snake(input : String) -> Words {
  if input.is_empty() {
    return Words([])
  }
  let parts = input.split("_")
  let words : Array[String] = []
  for part in parts {
    let part_str = part.to_string()
    if part_str.length() > 0 {
      words.push(part_str.to_lower())
    }
  }
  Words(FixedArray::from_array(words))
}

///|
/// Parse kebab-case string into Words
/// Example: "hello-world-test" -> Words(["hello", "world", "test"])
pub fn Words::from_kebab(input : String) -> Words {
  if input.is_empty() {
    return Words([])
  }
  let parts = input.split("-")
  let words : Array[String] = []
  for part in parts {
    let part_str = part.to_string()
    if part_str.length() > 0 {
      words.push(part_str.to_lower())
    }
  }
  Words(FixedArray::from_array(words))
}

///|
/// Parse SHOUTY_SNAKE_CASE string into Words
/// Example: "HELLO_WORLD_TEST" -> Words(["hello", "world", "test"])
pub fn Words::from_shouty_snake(input : String) -> Words {
  // Same as snake_case but input is uppercase
  Words::from_snake(input)
}

///|
/// Parse sentence case string into Words
/// Example: "Hello world test" -> Words(["hello", "world", "test"])
pub fn Words::from_sentence(input : String) -> Words {
  if input.is_empty() {
    return Words([])
  }
  let parts = input.split(" ")
  let words : Array[String] = []
  for part in parts {
    let part_str = part.to_string()
    if part_str.length() > 0 {
      words.push(part_str.to_lower())
    }
  }
  Words(FixedArray::from_array(words))
}

///|
/// Parse Title Case string into Words
/// Example: "Hello World Test" -> Words(["hello", "world", "test"])
pub fn Words::from_title(input : String) -> Words {
  // Same logic as sentence case - split on spaces
  Words::from_sentence(input)
}

///|
/// Parse SHOUTY-KEBAB-CASE string into Words
/// Example: "HELLO-WORLD-TEST" -> Words(["hello", "world", "test"])
pub fn Words::from_shouty_kebab(input : String) -> Words {
  // Same as kebab-case but input is uppercase
  Words::from_kebab(input)
}
