defmodule DigitalBible.Api.Volume do
  alias DigitalBible.Api.Base

  @expected_fields ~w(
    dam_id volume_name version_name media media_type updated_on
    collection_name status fcbh_id language_code language_name
    delivery version_code
  )

  @default_params %{
    status: "live",
    expired: "false"
  }

  def volumes(options \\ %{}) do
    @default_params
    |> Map.merge(options)
    |> make_request
  end

  defp make_request(params) do
    Base.request(url(), params, @expected_fields)
    |> Base.convert_to_models(DigitalBible.Model.Volume, [])
  end

  defp url do
    "/library/volume"
  end
end
