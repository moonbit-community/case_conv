# Case Conversion Library for MoonBit

A comprehensive MoonBit library for converting between different case styles including camelCase, snake_case, kebab-case, PascalCase, SHOUTY_SNAKE_CASE, Title Case, and more.

## Features

- **Multiple Case Styles**: Support for 8 different case styles
- **Bidirectional Conversion**: Parse from any case style and convert to any other
- **Type-Safe**: Strong typing with enums for case styles
- **Zero Dependencies**: Pure MoonBit implementation
- **Performance Optimized**: Efficient string building and parsing

## Supported Case Styles

| Style | Example | Description |
|-------|---------|-------------|
| `UpperCamel` | `HelloWorldTest` | PascalCase - each word capitalized |
| `LowerCamel` | `helloWorldTest` | camelCase - first word lowercase, others capitalized |
| `Snake` | `hello_world_test` | snake_case - words separated by underscores |
| `Kebab` | `hello-world-test` | kebab-case - words separated by hyphens |
| `ShoutySnake` | `HELLO_WORLD_TEST` | SHOUTY_SNAKE_CASE - uppercase with underscores |
| `Sentence` | `Hello world test` | Sentence case - first word capitalized |
| `Title` | `Hello World Test` | Title Case - each word capitalized |
| `ShoutyKebab` | `HELLO-WORLD-TEST` | SHOUTY-KEBAB-CASE - uppercase with hyphens |

## Quick Start

### Basic Usage

```moonbit
///|
test "basic conversion examples" {
  // Parse from camelCase and convert to snake_case
  let words = @case_conv.Words::from_lower_camel("helloWorldTest")
  let snake_result = words.into_snake()
  inspect(snake_result, content="hello_world_test")

  // Parse from kebab-case and convert to PascalCase
  let words2 = @case_conv.Words::from_kebab("hello-world-test")
  let pascal_result = words2.into_upper_camel()
  inspect(pascal_result, content="HelloWorldTest")

  // Parse from snake_case and convert to Title Case
  let words3 = @case_conv.Words::from_snake("my_awesome_function")
  let title_result = words3.into_title()
  inspect(title_result, content="My Awesome Function")
}
```

### Using the Generic `into` Method

```moonbit
///|
test "generic conversion with CaseStyle enum" {
  let words = @case_conv.Words::from_lower_camel("getUserById")

  // Convert to different styles using the generic method
  let snake = words.into(@case_conv.CaseStyle::Snake)
  inspect(snake, content="get_user_by_id")
  let kebab = words.into(@case_conv.CaseStyle::Kebab)
  inspect(kebab, content="get-user-by-id")
  let shouty = words.into(@case_conv.CaseStyle::ShoutySnake)
  inspect(shouty, content="GET_USER_BY_ID")
}
```

## Parsing Examples

### From Different Case Styles

```moonbit
///|
test "parsing from various case styles" {
  // From camelCase variations
  let camel_words = @case_conv.Words::from_lower_camel("httpResponseCode")
  inspect(camel_words, content="Words([\"http\", \"response\", \"code\"])")
  let pascal_words = @case_conv.Words::from_upper_camel("HttpResponseCode")
  inspect(pascal_words, content="Words([\"http\", \"response\", \"code\"])")

  // From separator-based styles
  let snake_words = @case_conv.Words::from_snake("http_response_code")
  inspect(snake_words, content="Words([\"http\", \"response\", \"code\"])")
  let kebab_words = @case_conv.Words::from_kebab("http-response-code")
  inspect(kebab_words, content="Words([\"http\", \"response\", \"code\"])")

  // From space-separated styles
  let sentence_words = @case_conv.Words::from_sentence("Http response code")
  inspect(sentence_words, content="Words([\"http\", \"response\", \"code\"])")
  let title_words = @case_conv.Words::from_title("Http Response Code")
  inspect(title_words, content="Words([\"http\", \"response\", \"code\"])")
}
```

### Edge Cases

```moonbit
///|
test "edge cases and special handling" {
  // Empty strings
  let empty_words = @case_conv.Words::from_snake("")
  inspect(empty_words, content="Words([])")
  let empty_result = empty_words.into_upper_camel()
  inspect(empty_result, content="")

  // Single word
  let single_words = @case_conv.Words::from_snake("hello")
  let single_result = single_words.into_upper_camel()
  inspect(single_result, content="Hello")

  // Already lowercase words
  let lower_words = @case_conv.Words::from_sentence("hello world")
  let camel_result = lower_words.into_lower_camel()
  inspect(camel_result, content="helloWorld")
}
```

## Conversion Examples

### Common Programming Patterns

```moonbit
///|
test "common programming case conversions" {
  // API endpoint naming
  let api_endpoint = @case_conv.Words::from_snake("get_user_profile")
  let url_path = api_endpoint.into_kebab()
  inspect(url_path, content="get-user-profile")

  // Database column to JavaScript property
  let db_column = @case_conv.Words::from_snake("created_at_timestamp")
  let js_property = db_column.into_lower_camel()
  inspect(js_property, content="createdAtTimestamp")

  // Environment variable naming
  let env_var = @case_conv.Words::from_kebab("database-connection-url")
  let env_name = env_var.into_shouty_snake()
  inspect(env_name, content="DATABASE_CONNECTION_URL")

  // Class name generation
  let class_words = @case_conv.Words::from_kebab("user-profile-service")
  let class_name = class_words.into_upper_camel()
  inspect(class_name, content="UserProfileService")
}
```

### Configuration and Documentation

```moonbit
///|
test "configuration and documentation examples" {
  // Configuration key transformations
  let config_key = @case_conv.Words::from_snake("max_retry_attempts")
  let yaml_key = config_key.into_kebab()
  inspect(yaml_key, content="max-retry-attempts")

  // Documentation title generation
  let func_name = @case_conv.Words::from_lower_camel("validateUserInput")
  let doc_title = func_name.into_title()
  inspect(doc_title, content="Validate User Input")

  // Sentence description
  let sentence = func_name.into_sentence()
  inspect(sentence, content="Validate user input")
}
```

## API Reference

### Types

- `Words(FixedArray[String])` - Internal representation of parsed words
- `CaseStyle` - Enum representing different case styles

### Core Functions

#### Parsing Functions
- `Words::from_upper_camel(String) -> Words` - Parse PascalCase
- `Words::from_lower_camel(String) -> Words` - Parse camelCase  
- `Words::from_snake(String) -> Words` - Parse snake_case
- `Words::from_kebab(String) -> Words` - Parse kebab-case
- `Words::from_shouty_snake(String) -> Words` - Parse SHOUTY_SNAKE_CASE
- `Words::from_sentence(String) -> Words` - Parse sentence case
- `Words::from_title(String) -> Words` - Parse Title Case
- `Words::from_shouty_kebab(String) -> Words` - Parse SHOUTY-KEBAB-CASE

#### Conversion Functions
- `Words::into_upper_camel(Words) -> String` - Convert to PascalCase
- `Words::into_lower_camel(Words) -> String` - Convert to camelCase
- `Words::into_snake(Words) -> String` - Convert to snake_case
- `Words::into_kebab(Words) -> String` - Convert to kebab-case
- `Words::into_shouty_snake(Words) -> String` - Convert to SHOUTY_SNAKE_CASE
- `Words::into_sentence(Words) -> String` - Convert to sentence case
- `Words::into_title(Words) -> String` - Convert to Title Case
- `Words::into_shouty_kebab(Words) -> String` - Convert to SHOUTY-KEBAB-CASE
- `Words::into(Words, CaseStyle) -> String` - Generic conversion function

## Installation

Add to your `moon.pkg.json`:

```json
{
  "import": [
    "illusory0x0/case_conv"
  ]
}
```

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.