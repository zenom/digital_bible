defmodule DigitalBible.Api.Book do
  @moduledoc """
  Lookup books based on a dam_id, from the Digital Bible Platform
  """
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    dam_id book_id book_name book_order number_of_chapters chapters
  )

  @default_params %{}

  def books(%Model.Volume{dam_id: dam_id}) do
    @default_params
    |> Map.merge(%{dam_id: dam_id})
    |> make_request
  end

  def books(options) do
    @default_params
    |> Map.merge(options)
    |> make_request
  end

  defp make_request(params) do
    url()
    |> Base.request(params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Book, [])
  end

  defp url do
    "/library/book"
  end
end
