defmodule DigitalBibleBookTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.filter_sensitive_data("key=.+&", "key=YOURKEY")
    HTTPoison.start
    use_cassette "book_list" do
      result = DigitalBible.books("ENGNASN")
      { :ok, book_list: result }
    end
  end

  test "book list count is correct", state do
    assert Enum.count(state[:book_list]) == 27
  end

  test "it makes Book models", state do
    first_book = List.first(state[:book_list])
    assert first_book == %DigitalBible.Model.Book {
      book_id: "Matt",
      book_name: "Matthew",
      book_order: "1",
      dam_id_root: "ENGNASN"
    }
  end
end
