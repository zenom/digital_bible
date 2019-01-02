defmodule DigitalBibleBaseTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
  end

  describe "convert_to_models" do
    test "puts a message" do
      sample ={:error, "This is a test"}
      assert DigitalBible.Api.Base.convert_to_models(sample, "", "") ==
        {:error, "Convert to models failed, with: This is a test"}
    end
  end

  describe "parse not found" do
    test "it returns NOT FOUND" do
      use_cassette "not_found_request" do
        assert DigitalBible.request("/library/bad_url", %{}, []) ==
          {:error, "NOT FOUND"}
      end
    end
  end

  describe "parse unknown status code" do
    test "it returns message" do
      use_cassette "unknown_request" do
        assert DigitalBible.request("/library/bookorder", %{}, []) ==
          {:error, "ERROR: 400"}
      end
    end
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
