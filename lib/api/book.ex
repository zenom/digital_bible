defmodule DigitalBible.Api.Book do
  alias DigitalBible.Api.Base
  alias DigitalBible.Model

  @expected_fields ~w(
    dam_id book_id book_name book_order number_of_chapters chapters
  )

  @doc """
  Get the list of books by passing in a Volume

  ## EXAMPLES
    iex> DigitalBible.books(%DigitalBible.Model.Volume{dam_id: <DAMID>})
    iex> []
  """

  def books(%Model.Volume{dam_id: dam_id}) do
    new_params = Map.merge(default_params(), %{dam_id: dam_id})
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Book, [])
  end

  @doc """
  Get the list of books

  ## EXAMPLES
    iex> DigitalBible.books
    []
  """
  def books(options) do
    new_params = Map.merge(default_params(), options)
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Book, [])
  end


  defp default_params do
    %{}
  end

  defp url do
    "/library/book"
  end
end
