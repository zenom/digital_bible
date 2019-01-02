defmodule DigitalBibleModelTest do
  use ExUnit.Case, async: true

  describe "Book" do
    test "is valid" do
      assert Map.keys(%DigitalBible.Model.Book{}) ==
        [:__struct__, :book_id, :book_name, :book_order, :chapters, :dam_id, :number_of_chapters]
    end
  end

  describe "Chapter" do
    test "is valid" do
      assert Map.keys(%DigitalBible.Model.Chapter{}) ==
        [:__struct__, :book_id, :chapter_id, :chapter_name, :dam_id]
    end
  end

  describe "Verse" do
    test "is valid" do
      assert Map.keys(%DigitalBible.Model.Verse{}) ==
        [:__struct__, :book_id, :book_name, :book_order, :chapter_id, :chapter_title, :paragraph_number, :verse_id, :verse_text]
    end
  end

  describe "Volume" do
    test "is valid" do
      assert Map.keys(%DigitalBible.Model.Volume{}) ==
        [:__struct__, :collection_name, :dam_id, :delivery, :fcbh_id, :language_code, :language_name, :media, :media_type, :status, :updated_on, :version_code, :version_name, :volume_name]
    end
  end
end
