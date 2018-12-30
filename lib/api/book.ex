defmodule DigitalBible.Api.Book do
  import DigitalBible.Api.Base

  @expected_fields ~w(
    book_order book_id book_name dam_id_root
  )

  # Parse them into a Model?

  @doc """
  Get the list of books

  ## EXAMPLES
    iex> DigitalBible.books
    []
  """
  def books(dam_id) do
    new_params = Map.merge(default_params(), %{ dam_id: dam_id})
    request(url(), new_params, @expected_fields)
    |> make_models([])
  end

  defp make_models([book|books], acc) do
    new_model = struct(DigitalBible.Model.Book, book)
    make_models(books, [new_model|acc])
  end
  defp make_models([], acc), do: Enum.reverse(acc)

  defp default_params do
    %{ }
  end

  defp url do
    "/library/bookorder"
  end
end
