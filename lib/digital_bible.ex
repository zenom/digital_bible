defmodule DigitalBible do
  #use HTTPoison.Base

  @moduledoc """
  Documentation for DigitalBible.
  """

  defdelegate request(url, params), to: DigitalBible.Api.Base
  defdelegate books(dam_id \\ "ENGNASN"), to: DigitalBible.Api.Book
end
