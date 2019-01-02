defmodule DigitalBible.Api.Verse do
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    book_name book_id book_order chapter_id chapter_title verse_id verse_text paragraph_number
  )

  def verse(%Model.Chapter{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id}) do
    new_params = Map.merge(default_params(), %{
      dam_id: dam_id,
      book_id: book_id,
      chapter_id: chapter_id
    })
    make_request(new_params)
  end

  def verses(options \\ %{}) do
    new_params = Map.merge(default_params(), options)
    make_request(new_params)
  end

  defp make_request(params) do
    Base.request(url(), params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Verse, [])
  end


  defp default_params do
    %{}
  end

  defp url do
    "/text/verse"
  end
end
