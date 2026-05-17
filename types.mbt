///|
/// immediate representation of a list of words
/// all word should be in lower case
/// e.g. ["hello", "world"]
///
pub(all) struct Words(FixedArray[String]) derive (
  Debug,
  ToJson,
  Eq,
  Compare,
  Hash,
)

///|
pub impl Show for Words with output(self, logger) {
  let Words(words) = self
  logger.write_string("Words([")
  for i in 0..<words.length() {
    if i > 0 {
      logger.write_string(", ")
    }
    logger.write_string("\"")
    logger.write_string(words[i])
    logger.write_string("\"")
  }
  logger.write_string("])")
}

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
} derive(Debug, ToJson, Eq, Compare, Hash)

///|
pub impl Show for CaseStyle with output(self, logger) {
  match self {
    UpperCamel => logger.write_string("UpperCamel")
    LowerCamel => logger.write_string("LowerCamel")
    Snake => logger.write_string("Snake")
    Kebab => logger.write_string("Kebab")
    ShoutySnake => logger.write_string("ShoutySnake")
    Sentence => logger.write_string("Sentence")
    Title => logger.write_string("Title")
    ShoutyKebab => logger.write_string("ShoutyKebab")
  }
}
