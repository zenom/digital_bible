defmodule DigitalBible.Api.Book do
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    dam_id book_id book_name book_order number_of_chapters chapters
  )

  @default_params %{}

  @doc """
  Get the list of books by passing in a Volume

  ## EXAMPLES
    iex> DigitalBible.books(%DigitalBible.Model.Volume{dam_id: <DAMID>})
    iex> []
  """

  def books(%Model.Volume{dam_id: dam_id}) do
    @default_params
    |> Map.merge(%{dam_id: dam_id})
    |> make_request
  end

  @doc """
  Get the list of books

  ## EXAMPLES
    iex> DigitalBible.books
    []
  """
  def books(options) do
    @default_params
    |> Map.merge(options)
    |> make_request
  end

  defp make_request(params) do
    Base.request(url(), params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Book, [])
  end

  defp url do
    "/library/book"
  end
end
