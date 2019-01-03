defmodule DigitalBible.Model.Book do
  @moduledoc """
  Model for a Book result from the API

  ## Reference
  https://www.digitalbibleplatform.com/docs/api-version-2/library-catalog/book-listing/
  """

  defstruct book_id: nil,
            book_name: nil,
            book_order: nil,
            dam_id: nil,
            number_of_chapters: nil,
            chapters: nil
  @type t :: %__MODULE__{}
end

defmodule DigitalBible.Model.Chapter do
  @moduledoc """
  Model for a Chapter result from the API

  ## Reference
  https://www.digitalbibleplatform.com/docs/api-version-2/library-catalog/chapter-listing/
  """
  defstruct dam_id: nil, book_id: nil, chapter_id: nil, chapter_name: nil
  @type t :: %__MODULE__{}
end

defmodule DigitalBible.Model.Verse do
  @moduledoc """
  Model for a Verse result from the API

  ## Reference
  https://www.digitalbibleplatform.com/docs/api-version-2/library-text/verse/
  """
  defstruct book_name: nil,
            book_id: nil,
            book_order: nil,
            chapter_id: nil,
            chapter_title: nil,
            verse_id: nil,
            verse_text: nil,
            paragraph_number: nil
  @type t :: %__MODULE__{}
end

defmodule DigitalBible.Model.Volume do
  @moduledoc """
  Model for a Volume result from the API

  ## Reference
  https://www.digitalbibleplatform.com/docs/api-version-2/library-catalog/volume-listing/
  """
  defstruct dam_id: nil,
            volume_name: nil,
            version_name: nil,
            media: nil,
            media_type: nil,
            updated_on: nil,
            collection_name: nil,
            status: nil,
            fcbh_id: nil,
            language_code: nil,
            language_name: nil,
            delivery: [],
            version_code: nil
  @type t :: %__MODULE__{}
end
