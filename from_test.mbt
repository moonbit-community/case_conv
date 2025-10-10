///|
test "Words::from_upper_camel with basic input" {
  let result = @case_conv.Words::from_upper_camel("HelloWorldTest")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_upper_camel with single word" {
  let result = @case_conv.Words::from_upper_camel("Hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_upper_camel with empty string" {
  let result = @case_conv.Words::from_upper_camel("")
  inspect(result, content="Words([])")
}

///|
test "Words::from_upper_camel with single char" {
  let result = @case_conv.Words::from_upper_camel("H")
  inspect(result, content="Words([\"h\"])")
}

///|
test "Words::from_upper_camel with consecutive capitals" {
  let result = @case_conv.Words::from_upper_camel("XMLHttpRequest")
  inspect(result, content="Words([\"x\", \"m\", \"l\", \"http\", \"request\"])")
}

///|
test "Words::from_lower_camel with basic input" {
  let result = @case_conv.Words::from_lower_camel("helloWorldTest")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_lower_camel with single word" {
  let result = @case_conv.Words::from_lower_camel("hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_lower_camel empty string" {
  let result = @case_conv.Words::from_lower_camel("")
  inspect(result, content="Words([])")
}

///|
test "Words::from_snake with basic input" {
  let result = @case_conv.Words::from_snake("hello_world_test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_snake with single word" {
  let result = @case_conv.Words::from_snake("hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_snake with empty string" {
  let result = @case_conv.Words::from_snake("")
  inspect(result, content="Words([])")
}

///|
test "Words::from_snake with multiple underscores" {
  let result = @case_conv.Words::from_snake("hello__world___test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_kebab with basic input" {
  let result = @case_conv.Words::from_kebab("hello-world-test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_kebab with single word" {
  let result = @case_conv.Words::from_kebab("hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_kebab with empty string" {
  let result = @case_conv.Words::from_kebab("")
  inspect(result, content="Words([])")
}

///|
test "Words::from_kebab with multiple hyphens" {
  let result = @case_conv.Words::from_kebab("hello--world---test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_shouty_snake with basic input" {
  let result = @case_conv.Words::from_shouty_snake("HELLO_WORLD_TEST")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_shouty_snake with mixed case" {
  let result = @case_conv.Words::from_shouty_snake("Hello_WORLD_test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_sentence with basic input" {
  let result = @case_conv.Words::from_sentence("Hello world test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_sentence with single word" {
  let result = @case_conv.Words::from_sentence("Hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_sentence with empty string" {
  let result = @case_conv.Words::from_sentence("")
  inspect(result, content="Words([])")
}

///|
test "Words::from_sentence with multiple spaces" {
  let result = @case_conv.Words::from_sentence("Hello  world   test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_title with basic input" {
  let result = @case_conv.Words::from_title("Hello World Test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_title with single word" {
  let result = @case_conv.Words::from_title("Hello")
  inspect(result, content="Words([\"hello\"])")
}

///|
test "Words::from_shouty_kebab with basic input" {
  let result = @case_conv.Words::from_shouty_kebab("HELLO-WORLD-TEST")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}

///|
test "Words::from_shouty_kebab with mixed case" {
  let result = @case_conv.Words::from_shouty_kebab("Hello-WORLD-test")
  inspect(result, content="Words([\"hello\", \"world\", \"test\"])")
}
