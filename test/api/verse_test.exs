defmodule DigitalBibleVerseTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
%DigitalBible.Model.Chapter{book_id: "Gen", chapter_id: "1", chapter_name: "Chapter 1", dam_id: "ENGNASO2ET"}
  setup_all do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
    use_cassette "verse_list" do
      result = DigitalBible.verses(%{dam_id: "ENGNASO2ET", book_id: "Gen", chapter_id: "1"})
      { :ok, verse_list: result }
    end
  end

  test "verse list count is correct", state do
    assert Enum.count(state[:verse_list]) == 31
  end

  test "it makes Verse models", state do
    first_result = List.first(state[:verse_list])
    assert first_result == %DigitalBible.Model.Verse{
      book_id: "Gen", chapter_id: "1", book_name: "Genesis", book_order: "1", chapter_title: "Chapter 1", paragraph_number: "1", verse_id: "1", verse_text: "In the beginning God created the heavens and the earth. \n\t\t\t"
    }
  end
end
