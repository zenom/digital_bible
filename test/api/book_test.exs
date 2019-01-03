defmodule DigitalBibleBookTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "Base functionality for book" do
    setup [:build_default_list]

    test "book list count is correct", state do
      assert Enum.count(state[:book_list]) == 27
    end

    test "it makes Book models", state do
      first_book = List.first(state[:book_list])

      assert first_book == %DigitalBible.Model.Book{
               book_id: "Matt",
               book_name: "Matthew",
               book_order: "55",
               chapters:
                 "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28",
               dam_id: "ENGNASN2ET",
               number_of_chapters: "28"
             }
    end
  end

  describe "When passed a Volume" do
    setup [:build_list_by_volume]

    test "when we have a volume defined", state do
      assert Enum.count(state[:book_list]) == 39
    end
  end

  defp build_default_list(_) do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")

    use_cassette "book_list" do
      result = DigitalBible.books(%{dam_id: "ENGNASN2ET"})
      {:ok, book_list: result}
    end
  end

  defp build_list_by_volume(_) do
    volume = %DigitalBible.Model.Volume{dam_id: "ENGNASO2ET"}
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")

    use_cassette "book_list_with_volume" do
      result = DigitalBible.books(volume)
      {:ok, book_list: result}
    end
  end
end
