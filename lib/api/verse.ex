defmodule DigitalBible.Api.Verse do
  @moduledoc """
  Get verse text and details for a particular volume, book & chapter
  """
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    book_name book_id book_order chapter_id chapter_title verse_id verse_text paragraph_number
  )

  @default_params %{}

  def verse(%Model.Chapter{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id}, verse_id) do
    @default_params
    |> Map.merge(%{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id, verse_id: verse_id})
    |> make_request
  end

  def verses(%Model.Chapter{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id}) do
    @default_params
    |> Map.merge(%{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id})
    |> make_request
  end

  defp make_request(params) do
    url()
    |> Base.request(params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Verse, [])
  end

  defp url do
    "/text/verse"
  end
end
