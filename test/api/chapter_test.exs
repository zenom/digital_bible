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
    assert Enum.count(state[:chapter_list]) == 50
  end

  test "it makes Chapter models", state do
    first_result = List.first(state[:chapter_list])
    assert first_result == %DigitalBible.Model.Chapter{
      book_id: "Gen", chapter_id: "1", chapter_name: "Chapter 1", dam_id: "ENGNASO2ET"
    }
  end
end
