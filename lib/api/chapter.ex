defmodule DigitalBible.Api.Chapter do
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    dam_id book_id chapter_id chapter_name
  )

  # def chapters(%Model.Book{dam_id: dam_id, book_id: book_id, chapter_id: chapter_id}) do
  # end

  # def chapters(%Model.Book{dam_id: dam_id, book_id: book_id}) do
  # end

  def chapters(options) do
    new_params = Map.merge(default_params(), options)
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Chapter, [])
  end

  # dam_id, @book_id
  defp default_params do
    %{}
  end

  defp url do
    "/library/chapter"
  end

end
