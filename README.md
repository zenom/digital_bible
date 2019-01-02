# DigitalBible

[![Coverage Status](https://coveralls.io/repos/github/zenom/digital_bible/badge.svg?branch=master)](https://coveralls.io/github/zenom/digital_bible?branch=master)

Elixir client for the Digital Bible Platform. 

https://www.digitalbibleplatform.com

## Usage
```elixir
iex> volumes = DigitalBible.volumes(%{language_code: "ENG", version_code: "NAS"})
iex> [%DigitalBible.Model.Volume{}, %DigitalBible.Model.Volume{}]
```
Now take the result and get the books for the volume:

```elixir
iex> first_volume = List.first(volumes)
iex> DigitalBible.books(first_volume)
iex> [%DigitalBible.Model.Book{}, ...]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `digital_bible` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:digital_bible, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/digital_bible](https://hexdocs.pm/digital_bible).

