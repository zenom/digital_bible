defmodule DigitalBible do
  #use HTTPoison.Base

  @moduledoc """
  Documentation for DigitalBible.
  """


  @doc """
  Get a list of all the books for a particular dam_id (default: ENGNASN)
  """
  defdelegate books(options \\ %{}), to: DigitalBible.Api.Book

  @doc """
  List of volumes available on the platform
  https://www.digitalbibleplatform.com/docs/api-version-2/library-catalog/volume-listing/
  """
  defdelegate volumes(options \\ %{}), to: DigitalBible.Api.Volume

  # should not even really be accessible to people.....
  defdelegate request(url, params, expected_fields), to: DigitalBible.Api.Base
end
