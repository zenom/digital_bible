defmodule DigitalBible do
  #use HTTPoison.Base

  @moduledoc """
  Documentation for DigitalBible.
  """


  @doc """
  Get a list of all the books for a particular dam_id (default: ENGNASN)
  """
  defdelegate books(dam_id \\ "ENGNASN"), to: DigitalBible.Api.Book

  # should not even really be accessible to people.....
  defdelegate request(url, params, expected_fields), to: DigitalBible.Api.Base
end
