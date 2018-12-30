defmodule DigitalBible.Api.Volume do
  alias DigitalBible.Api.Base

  @expected_fields ~w(
    dam_id volume_name version_name media media_type updated_on
    collection_name status fcbh_id language_code language_name
    delivery version_code
  )

  def volumes(options \\ %{}) do
    new_params = Map.merge(default_params(), options)
    Base.request(url(), new_params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Volume, [])
  end

  defp default_params do
    %{
      status: "live",
      expired: "false"
    }
  end

  defp url do
    "/library/volume"
  end
end
