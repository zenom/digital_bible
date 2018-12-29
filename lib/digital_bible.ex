defmodule DigitalBible do
  use HTTPoison.Base

  @moduledoc """
  Documentation for DigitalBible.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DigitalBible.hello()
      :world

  """
  def hello do
    :world
  end

  @expected_fields ~w(
    book_id dam_id chapter_id chapter_name
  )

  def process_request_url(url) do
    "https://dbt.io" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(&(Map.take(&1, @expected_fields)))
    |> Enum.map(&string_keys_to_atoms(&1))
  end

  def string_keys_to_atoms(item) do
    for {key, val} <- item, into: %{} do
      {String.to_atom(key), val}
    end
  end
end
