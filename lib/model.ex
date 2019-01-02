defmodule DigitalBible.Model.Book do
  defstruct book_id: nil, book_name: nil, book_order: nil, dam_id_root: nil
end

defmodule DigitalBible.Model.Chapter do
  defstruct dam_id: nil, book_id: nil, chapter_id: nil, chapter_name: nil
end

defmodule DigitalBible.Model.Volume do
  defstruct dam_id: nil, volume_name: nil, version_name: nil, media: nil,
    media_type: nil, updated_on: nil, collection_name: nil, status: nil,
    fcbh_id: nil, language_code: nil, language_name: nil, delivery: [],
    version_code: nil
end

