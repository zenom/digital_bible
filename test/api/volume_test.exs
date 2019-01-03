defmodule DigitalBibleVolumeTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    use_cassette "volume_list" do
      result = DigitalBible.volumes()
      {:ok, volume_list: result}
    end
  end

  test "volume list count is correct", state do
    assert Enum.count(state[:volume_list]) == 2932
  end

  test "it makes Volume models", state do
    first_result = List.first(state[:volume_list])

    assert first_result == %DigitalBible.Model.Volume{
             collection_name: "",
             dam_id: "1BISLSS2DV",
             delivery: ["sign_language"],
             fcbh_id: "1BISLSS2DV",
             language_code: "1BI",
             language_name: "Burundian Sign Language",
             media: "video",
             media_type: "Drama",
             status: "live",
             updated_on: "2014-04-01 16:01:41",
             version_code: "SLS",
             version_name: "Sign Language Stories",
             volume_name: "DOOR International Burundi Sign Language"
           }
  end
end
