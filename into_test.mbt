///|
test "Words::into_upper_camel with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_upper_camel()
  inspect(result, content="HelloWorldTest")
}

///|
test "Words::into_upper_camel with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_upper_camel()
  inspect(result, content="Hello")
}

///|
test "Words::into_upper_camel with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_upper_camel()
  inspect(result, content="")
}

///|
test "Words::into_upper_camel with empty string in words" {
  let words = @case_conv.Words(["hello", "", "world"])
  let result = words.into_upper_camel()
  inspect(result, content="HelloWorld")
}

///|
test "Words::into_lower_camel with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_lower_camel()
  inspect(result, content="helloWorldTest")
}

///|
test "Words::into_lower_camel with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_lower_camel()
  inspect(result, content="hello")
}

///|
test "Words::into_lower_camel with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_lower_camel()
  inspect(result, content="")
}

///|
test "Words::into_snake with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_snake()
  inspect(result, content="hello_world_test")
}

///|
test "Words::into_snake with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_snake()
  inspect(result, content="hello")
}

///|
test "Words::into_snake with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_snake()
  inspect(result, content="")
}

///|
test "Words::into_kebab with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_kebab()
  inspect(result, content="hello-world-test")
}

///|
test "Words::into_kebab with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_kebab()
  inspect(result, content="hello")
}

///|
test "Words::into_kebab with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_kebab()
  inspect(result, content="")
}

///|
test "Words::into_shouty_snake with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_shouty_snake()
  inspect(result, content="HELLO_WORLD_TEST")
}

///|
test "Words::into_shouty_snake with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_shouty_snake()
  inspect(result, content="HELLO")
}

///|
test "Words::into_sentence with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_sentence()
  inspect(result, content="Hello world test")
}

///|
test "Words::into_sentence with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_sentence()
  inspect(result, content="Hello")
}

///|
test "Words::into_sentence with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_sentence()
  inspect(result, content="")
}

///|
test "Words::into_title with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_title()
  inspect(result, content="Hello World Test")
}

///|
test "Words::into_title with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_title()
  inspect(result, content="Hello")
}

///|
test "Words::into_title with empty words" {
  let words = @case_conv.Words([])
  let result = words.into_title()
  inspect(result, content="")
}

///|
test "Words::into_shouty_kebab with basic input" {
  let words = @case_conv.Words(["hello", "world", "test"])
  let result = words.into_shouty_kebab()
  inspect(result, content="HELLO-WORLD-TEST")
}

///|
test "Words::into_shouty_kebab with single word" {
  let words = @case_conv.Words(["hello"])
  let result = words.into_shouty_kebab()
  inspect(result, content="HELLO")
}

///|
test "Round trip test - upper camel" {
  let original = "HelloWorldTest"
  let words = @case_conv.Words::from_upper_camel(original)
  let result = words.into_upper_camel()
  inspect(result, content="HelloWorldTest")
}

///|
test "Round trip test - snake case" {
  let original = "hello_world_test"
  let words = @case_conv.Words::from_snake(original)
  let result = words.into_snake()
  inspect(result, content="hello_world_test")
}
