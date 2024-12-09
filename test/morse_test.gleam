import gleeunit
import gleeunit/should
import morse.{Comma, Dot, Space, encode, to_string}

pub fn main() {
  gleeunit.main()
}

pub fn encode_test() {
  "SOS"
  |> encode
  |> should.equal([
    Dot,
    Dot,
    Dot,
    Space,
    Comma,
    Comma,
    Comma,
    Space,
    Dot,
    Dot,
    Dot,
  ])
}

pub fn chars_test() {
  "S" |> encode |> to_string |> should.equal("...")
  "O" |> encode |> to_string |> should.equal("---")
  "H" |> encode |> to_string |> should.equal("....")
}

pub fn words_test() {
  "SOS" |> encode |> to_string |> should.equal("... --- ...")
  "HELP" |> encode |> to_string |> should.equal(".... . .-.. .--.")
  "LOVE" |> encode |> to_string |> should.equal(".-.. --- ...- .")
}

pub fn sentences_test() {
  "Nice to meet you"
  |> encode
  |> to_string
  |> should.equal("-. .. -.-. . / - --- / -- . . - / -.-- --- ..-")

  "Nice to meet you"
  |> encode
  |> to_string
  |> should.equal("-. .. -.-. . / - --- / -- . . - / -.-- --- ..-")

  "I love you"
  |> encode
  |> to_string
  |> should.equal(".. / .-.. --- ...- . / -.-- --- ..-")
}
