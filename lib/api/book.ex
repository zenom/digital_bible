defmodule DigitalBible.Api.Book do
  alias DigitalBible.Api.Base

  @expected_fields ~w(
    book_order book_id book_name dam_id_root
  )

  @doc """
  Get the list of books

  ## EXAMPLES
    iex> DigitalBible.books
    []
  """
  def books(dam_id) do
    new_params = Map.merge(default_params(), %{ dam_id: dam_id})
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Book, [])
  end

  defp default_params do
    %{ }
  end

  defp url do
    "/library/bookorder"
  end
end
