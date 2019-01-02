defmodule DigitalBibleChapterTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
    use_cassette "chapter_list" do
      result = DigitalBible.chapters(%{dam_id: "ENGNASO2ET", book_id: "Gen"})
      { :ok, chapter_list: result }
    end
  end

  test "chapter list count is correct", state do
    IO.inspect state[:chapter_list]
    assert Enum.count(state[:chapter_list]) == 50
  end
end
