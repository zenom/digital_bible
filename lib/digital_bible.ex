defmodule DigitalBible do
  @moduledoc """
  Documentation for DigitalBible.
  """

  @doc """
  Get a list of all the books for a particular `DigitalBible.Model.Volume`

  Returns - List of `DigitalBible.Model.Book`

  ## Examples

      iex> volume = List.first(
      ...> DigitalBible.volumes(%{dam_id: "ENGNASN2ET"})
      ...> )
      iex> DigitalBible.books(volume)
  """
  defdelegate books(volume \\ %DigitalBible.Model.Volume{}), to: DigitalBible.Api.Book

  @doc """
  Get chapter details for a particular `DigitalBible.Model.Book`

  Returns - List of `DigitalBible.Model.Chapter`

  ## Examples

      iex> book = %DigitalBible.Model.Book{dam_id: "ENGNASN2ET", book_id: "Matt"}
      iex> chapters = DigitalBible.chapters(book)
      iex> length(chapters)
      28
  """
  defdelegate chapters(book \\ %DigitalBible.Model.Book{}), to: DigitalBible.Api.Chapter

  @doc """
  Get verses for a `DigitalBook.Model.Chapter`

  Returns - List of `DigitalBook.Model.Verse`

  ## Examples
      iex> book = %DigitalBible.Model.Book{dam_id: "ENGNASN2ET", book_id: "Matt"}
      iex> chapters = DigitalBible.chapters(book)
      iex> chapter = List.first(chapters)
      iex> verses = DigitalBible.verses(chapter)
      iex> length(verses)
      25
  """
  defdelegate verses(chapter \\ %DigitalBible.Model.Chapter{}), to: DigitalBible.Api.Verse

  @doc """
  Get verses for a `DigitalBook.Model.Chapter` and a `verse_id`

  Returns - List with a `DigitalBook.Model.Verse`

  ## Examples
      iex> book = %DigitalBible.Model.Book{dam_id: "ENGNASN2ET", book_id: "Matt"}
      iex> chapters = DigitalBible.chapters(book)
      iex> chapter = List.first(chapters)
      iex> verses = DigitalBible.verses(chapter, "1")
      iex> length(verse)
      1
  """
  defdelegate verse(chapter \\ %DigitalBible.Model.Chapter{}, verse_id),
    to: DigitalBible.Api.Verse

  @doc """
  Get volumes the API supports

  Pass in a partial dam_id, language_code, etc., to filter

  Returns - List with a `DigitalBook.Model.Volume`

  ## Examples
      iex> volumes = DigitalBible.volumes{dam_id: "ENGNAS"}
      iex> length(volumes)
      2
  """
  defdelegate volumes(options \\ %{}), to: DigitalBible.Api.Volume

  # should not even really be accessible to people.....
  @doc false
  defdelegate request(url, params, expected_fields), to: DigitalBible.Api.Base
end
