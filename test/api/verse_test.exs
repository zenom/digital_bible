defmodule DigitalBibleVerseTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "Default query" do
    setup [:build_default_list]

    test "verse list count is correct", state do
      assert Enum.count(state[:verse_list]) == 31
    end

    test "it makes Verse models", state do
      first_result = List.first(state[:verse_list])

      assert first_result == %DigitalBible.Model.Verse{
               book_id: "Gen",
               chapter_id: "1",
               book_name: "Genesis",
               book_order: "1",
               chapter_title: "Chapter 1",
               paragraph_number: "1",
               verse_id: "1",
               verse_text: "In the beginning God created the heavens and the earth. \n\t\t\t"
             }
    end
  end

  describe "When passing a chapter model" do
    setup [:build_list_with_model]

    test "it makes Verse models", state do
      first_result = List.first(state[:verse_list])

      assert first_result == %DigitalBible.Model.Verse{
               verse_id: "1",
               book_id: "Matt",
               book_name: "Matthew",
               book_order: "55",
               chapter_id: "3",
               chapter_title: "Chapter 3",
               paragraph_number: "3",
               verse_text:
                 "Now in those days John the Baptist came, preaching in the wilderness of Judea, saying, \n\t\t\t"
             }
    end
  end

  defp build_default_list(_) do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")

    use_cassette "verse_list" do
      result =
        DigitalBible.verses(%DigitalBible.Model.Chapter{
          dam_id: "ENGNASO2ET",
          book_id: "Gen",
          chapter_id: "1"
        })

      {:ok, verse_list: result}
    end
  end

  def build_list_with_model(_) do
    chapter = %DigitalBible.Model.Chapter{dam_id: "ENGNASN2ET", book_id: "Matt", chapter_id: "3"}
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")

    use_cassette "verse_list_with_model" do
      result = DigitalBible.verse(chapter, "1")
      {:ok, verse_list: result}
    end
  end
end
