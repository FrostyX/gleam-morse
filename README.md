# Morsey

A package for encoding and decoding Morse code in Gleam.

[![Package Version](https://img.shields.io/hexpm/v/morsey)](https://hex.pm/packages/morsey)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/morsey/)


## Usage

```gleam
import gleam/io
import morsey

let text = "Hello world!"
case morsey.encode(text) {
  Ok(symbols) ->
    io.println("The Morse code for " <> text <> " is " <> to_string(symbols))
  Error(morsey.InvalidCharacter(char)) ->
    io.println_error("Invalid character: " <> char)
}
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
