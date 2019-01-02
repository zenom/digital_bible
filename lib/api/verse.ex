defmodule DigitalBible.Api.Verse do
  alias DigitalBible.Api.Base

  @expected_fields ~w(
    book_name book_id book_order chapter_id chapter_title verse_id verse_text paragraph_number
  )

  def verses(options \\ %{}) do
    new_params = Map.merge(default_params(), options)
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Verse, [])
  end
  # alias verse/verses?

  defp default_params do
    %{}
  end

  defp url do
    "/text/verse"
  end
end
