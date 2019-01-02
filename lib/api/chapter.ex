defmodule DigitalBible.Api.Chapter do
  @moduledoc """
  Lookup chapter information from the Digital Bible Platform
  """
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    dam_id book_id chapter_id chapter_name
  )

  @default_params %{}

  def chapters(%Model.Book{dam_id: dam_id, book_id: book_id}) do
    @default_params
    |> Map.merge(%{dam_id: dam_id, book_id: book_id})
    |> make_request
  end

  def chapters(options) do
    @default_params
    |> Map.merge(options)
    |> make_request
  end

  defp make_request(params) do
    url()
    |> Base.request(params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Chapter, [])
  end

  defp url do
    "/library/chapter"
  end

end
