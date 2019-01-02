defmodule DigitalBible.Api.Verse do
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    book_name book_id book_order chapter_id chapter_title verse_id verse_text paragraph_number
  )

  @default_params %{}

  def verse(%Model.Chapter{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id}) do
    @default_params
    |> Map.merge(%{ dam_id: dam_id, book_id: book_id, chapter_id: chapter_id })
    |> make_request
  end

  def verses(options \\ %{}) do
    @default_params
    |> Map.merge(options)
    |> make_request
  end

  defp make_request(params) do
    Base.request(url(), params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Verse, [])
  end

  defp url do
    "/text/verse"
  end
end
