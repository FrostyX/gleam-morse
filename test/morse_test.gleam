import gleam/result
import gleeunit
import gleeunit/should
import morse.{Comma, Dot, Space, encode, to_string}

pub fn main() {
  gleeunit.main()
}

pub fn encode_test() {
  "SOS"
  |> encode
  |> result.unwrap([])
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
  "S" |> encode |> result.unwrap([]) |> to_string |> should.equal("...")
  "O" |> encode |> result.unwrap([]) |> to_string |> should.equal("---")
  "H" |> encode |> result.unwrap([]) |> to_string |> should.equal("....")
}

pub fn words_test() {
  "SOS"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal("... --- ...")
  "HELP"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal(".... . .-.. .--.")
  "LOVE"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal(".-.. --- ...- .")
}

pub fn sentences_test() {
  "What is your name?"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal(
    ".-- .... .- - / .. ... / -.-- --- ..- .-. / -. .- -- . ..--..",
  )

  "Nice to meet you"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal("-. .. -.-. . / - --- / -- . . - / -.-- --- ..-")

  "I love you"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal(".. / .-.. --- ...- . / -.-- --- ..-")
}

pub fn special_characters_test() {
  "Oh my !@$& god!"
  |> encode
  |> result.unwrap([])
  |> to_string
  |> should.equal(
    "--- .... / -- -.-- / -.-.-- .--.-. ...-..- .-... / --. --- -.. -.-.--",
  )
}
