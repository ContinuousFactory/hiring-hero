defmodule Hiringhero.Document do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]

  def __storage, do: Arc.Storage.Local

  # Whitelist file extensions:
  # def validate({file, _}) do
  #   ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  # end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png"}
  end

  def filename(version,  {file, scope}), do: "#{version}-#{file.file_name}"

  def storage_dir(version, {file, scope}) do
    "uploads/documents/#{scope.id}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end
end
