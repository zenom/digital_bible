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
    expected_fields = ~w(
      book_id
    )
    use_cassette "base_request" do
      response = DigitalBible.request("/library/bookorder", params, expected_fields)
      assert Enum.count(response) == 39
    end
  end
end
