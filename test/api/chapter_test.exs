defmodule DigitalBibleChapterTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "Default query" do
    setup [:build_default_list]

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

  describe "When passing a Book model" do
    setup [:build_list_with_book]
    test "chapter list count is correct", state do
      assert Enum.count(state[:chapter_list]) == 28
    end
  end

  defp build_default_list(_) do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
    use_cassette "chapter_list" do
      result = DigitalBible.chapters(%{dam_id: "ENGNASO2ET", book_id: "Gen"})
      {:ok, chapter_list: result}
    end
  end

  defp build_list_with_book(_) do
    book = %DigitalBible.Model.Book{book_id: "Matt", dam_id: "ENGNASN2ET"}
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
    use_cassette "chapter_list_with_book" do
      result = DigitalBible.chapters(book)
      {:ok, chapter_list: result}
    end
  end
end
