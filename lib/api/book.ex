defmodule DigitalBible.Api.Book do
  import DigitalBible.Api.Base

  alias DigitalBible.Api.Base
  alias HTTPoison.Response

  @expected_fields ~w(
    book_order book_id book_name dam_id_root
  )

  @doc """
  Get the list of books

  # by dam_id?
  """
  def books do
    request(url(), params())
    |> parse(@expected_fields)
  end

  defp params do
    %{
      dam_id: "ENGNASO2ET"
    }
  end

  defp url do
    "/library/bookorder"
  end
end
