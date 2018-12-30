defmodule DigitalBible.Api.Base do
  @moduledoc """
  Base module for the API modules for different endpoints
  """

  @doc """
  Send a request based on passed in params.
  Build a request, put in the api key and then make it
  """
  def request(url, params, expected_fields) do
    base_url() <> url
    |> HTTPoison.get([], [
      params: Map.merge(%{
        key: Application.get_env(:digital_bible, :api_key),
        v: Application.get_env(:digital_bible, :api_version),
        reply: "json"
      }, params)
    ])
    |> parse(expected_fields)
  end

  defp parse({:ok, %HTTPoison.Response{status_code: 200, body: body}}, expected_fields) do
    body
    |> Jason.decode!
    |> Enum.map(&(Map.take(&1, expected_fields)))
    |> Enum.map(&string_keys_to_atoms(&1))
  end

  defp parse({:ok, %HTTPoison.Response{status_code: 404}}, _) do
    IO.puts "NOT FOUND"
  end

  defp parse({:error, %HTTPoison.Error{reason: reason}}, _) do
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
