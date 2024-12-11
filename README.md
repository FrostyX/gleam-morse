# Gleam Morse code

A package for encoding and decoding Morse code in Gleam.

<!--
[![Package Version](https://img.shields.io/hexpm/v/morse)](https://hex.pm/packages/morse)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/morse/)
-->

## Usage

```gleam
import gleam/io
import morse

let text = "Hello world!"
case morse.encode(text) {
  Ok(symbols) ->
    io.println("The Morse code for " <> text <> " is " <> to_string(symbols))
  Error(morse.InvalidCharacter(char)) ->
    io.println_error("Invalid character: " <> char)
}
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
