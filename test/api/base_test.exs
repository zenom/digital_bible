defmodule DigitalBibleBaseTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
  end

  test "base request" do
    params = %{
      dam_id: "ENGNASO2ET"
    }
    use_cassette "base_request" do
      response = DigitalBible.request("/library/bookorder", params)
      parse    = DigitalBible.Api.Base.parse(response, ~w(book_id))
      assert Enum.count(parse) == 39
    end
  end
end
