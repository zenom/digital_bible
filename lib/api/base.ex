defmodule DigitalBible.Api.Base do
  @moduledoc """
  Base module for the API modules for different endpoints
  """

  @doc """
  Send a request based on passed in params.
  Build a request, put in the api key and then make it
  """
  def request(url, params) do
    base_url() <> url
    |> HTTPoison.get([], [
      params: Map.merge(%{
        key: Application.get_env(:digital_bible, :api_key),
        v: Application.get_env(:digital_bible, :api_version)
      }, params)
    ])
  end

  @doc """
  Parse the result from the request, when its a valid result
  """
  def parse({:ok, %HTTPoison.Response{status_code: 200, body: body}}, expected_fields) do
    body
    |> Poison.decode!
    |> Enum.map(&(Map.take(&1, expected_fields)))
    |> Enum.map(&string_keys_to_atoms(&1))
  end

  @doc """
  Parse the result when the result is not found
  """
  def parse({:ok, %HTTPoison.Response{status_code: 404}}) do
    IO.puts "NOT FOUND"
  end

  @doc """
  Parse the result when there is an unknown error
  """
  def parse({:error, %HTTPoison.Error{reason: reason}}) do
    IO.puts reason
  end

  defp string_keys_to_atoms(item) do
    for {key, val} <- item, into: %{} do
      {String.to_atom(key), val}
    end
  end

  defp base_url do
    "https://dbt.io"
  end
end
