///|
/// Convert Words to UpperCamelCase (PascalCase) string
/// Example: Words(["hello", "world", "test"]) -> "HelloWorldTest"
pub fn Words::into_upper_camel(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  for word in words {
    if word.length() > 0 {
      match word.get_char(0) {
        Some(first_char) => {
          let capitalized_first = if first_char >= 'a' && first_char <= 'z' {
            Int::unsafe_to_char(first_char.to_int() - 32) // Convert to uppercase
          } else {
            first_char
          }
          sb.write_char(capitalized_first)
          if word is [_, .. rest_word] && !rest_word.is_empty() {
            sb.write_string(rest_word.to_owned())
          }
        }
        None => () // Skip empty words
      }
    }
  }
  sb.to_string()
}

///|
/// Convert Words to lowerCamelCase string
/// Example: Words(["hello", "world", "test"]) -> "helloWorldTest"
pub fn Words::into_lower_camel(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  for i, word in words.iter2() {
    if word.length() > 0 {
      if i == 0 {
        // First word stays lowercase
        sb.write_string(word)
      } else {
        // Subsequent words get capitalized
        match word.get_char(0) {
          Some(first_char) => {
            let capitalized_first = if first_char >= 'a' && first_char <= 'z' {
              Int::unsafe_to_char(first_char.to_int() - 32) // Convert to uppercase
            } else {
              first_char
            }
            sb.write_char(capitalized_first)
            if word is [_, .. rest_word] && !rest_word.is_empty() {
              sb.write_string(rest_word.to_owned())
            }
          }
          None => () // Skip empty words
        }
      }
    }
  }
  sb.to_string()
}

///|
/// Convert Words to snake_case string
/// Example: Words(["hello", "world", "test"]) -> "hello_world_test"
pub fn Words::into_snake(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char('_')
      }
      sb.write_string(word)
      first = false
    }
  }
  sb.to_string()
}

///|
/// Convert Words to kebab-case string
/// Example: Words(["hello", "world", "test"]) -> "hello-world-test"
pub fn Words::into_kebab(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char('-')
      }
      sb.write_string(word)
      first = false
    }
  }
  sb.to_string()
}

///|
/// Convert Words to SHOUTY_SNAKE_CASE string
/// Example: Words(["hello", "world", "test"]) -> "HELLO_WORLD_TEST"
pub fn Words::into_shouty_snake(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char('_')
      }
      sb.write_string(word.to_upper())
      first = false
    }
  }
  sb.to_string()
}

///|
/// Convert Words to sentence case string
/// Example: Words(["hello", "world", "test"]) -> "Hello world test"
pub fn Words::into_sentence(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut is_first_word = true
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char(' ')
      }
      if is_first_word {
        // First word gets capitalized
        match word.get_char(0) {
          Some(first_char) => {
            let capitalized_first = if first_char >= 'a' && first_char <= 'z' {
              Int::unsafe_to_char(first_char.to_int() - 32) // Convert to uppercase
            } else {
              first_char
            }
            sb.write_char(capitalized_first)
            if word is [_, .. rest_word] && !rest_word.is_empty() {
              sb.write_string(rest_word.to_owned())
            }
          }
          None => () // Skip empty words
        }
        is_first_word = false
      } else {
        // Other words stay lowercase
        sb.write_string(word)
      }
      first = false
    }
  }
  sb.to_string()
}

///|
/// Convert Words to Title Case string
/// Example: Words(["hello", "world", "test"]) -> "Hello World Test"
pub fn Words::into_title(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char(' ')
      }
      match word.get_char(0) {
        Some(first_char) => {
          let capitalized_first = if first_char >= 'a' && first_char <= 'z' {
            Int::unsafe_to_char(first_char.to_int() - 32) // Convert to uppercase
          } else {
            first_char
          }
          sb.write_char(capitalized_first)
          if word is [_, .. rest_word] && !rest_word.is_empty() {
            sb.write_string(rest_word.to_owned())
          }
        }
        None => () // Skip empty words
      }
      first = false
    }
  }
  sb.to_string()
}

///|
/// Convert Words to SHOUTY-KEBAB-CASE string
/// Example: Words(["hello", "world", "test"]) -> "HELLO-WORLD-TEST"
pub fn Words::into_shouty_kebab(self : Words) -> String {
  let sb = StringBuilder::new()
  let Words(words) = self
  let mut first = true
  for word in words {
    if word.length() > 0 {
      if !first {
        sb.write_char('-')
      }
      sb.write_string(word.to_upper())
      first = false
    }
  }
  sb.to_string()
}

///|
pub fn Words::into(self : Words, case : CaseStyle) -> String {
  match case {
    UpperCamel => self.into_upper_camel()
    LowerCamel => self.into_lower_camel()
    Snake => self.into_snake()
    Kebab => self.into_kebab()
    ShoutySnake => self.into_shouty_snake()
    Sentence => self.into_sentence()
    Title => self.into_title()
    ShoutyKebab => self.into_shouty_kebab()
  }
}
