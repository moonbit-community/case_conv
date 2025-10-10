///|
/// immediate representation of a list of words
/// all word should be in lower case
/// e.g. ["hello", "world"]
///
pub(all) struct Words(FixedArray[String]) derive(Show, ToJson, Eq, Compare, Hash)

///|
///
/// case styles reference:
///  
/// https://en.wikipedia.org/wiki/Snake_case
/// https://en.wikipedia.org/wiki/Camel_case
/// https://en.wikipedia.org/wiki/Letter_case#Kebab_case
/// https://en.wikipedia.org/wiki/Letter_case#Sentence_case
/// https://en.wikipedia.org/wiki/Title_case
pub(all) enum CaseStyle {
  /// UpperCamelCase (PascalCase)
  UpperCamel
  /// lowerCamelCase
  LowerCamel
  /// snake_case
  Snake
  /// kebab-case
  Kebab
  /// SHOUTY_SNAKE_CASE (C language constant style)
  ShoutySnake
  /// sentence case
  Sentence
  /// Title Case
  Title
  /// SHOUTY-KEBAB-CASE
  ShoutyKebab
} derive(Show, ToJson, Eq, Compare, Hash)
