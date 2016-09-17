defmodule Hiringhero.UserView do
  use Hiringhero.Web, :view
  alias Hiringhero.User
  alias Hiringhero.Organisation

  def first_name(%User{name: name}) do
    name
      |> String.split(" ")
      |> Enum.at(0)
  end

  def organisation_name(org) do
    if org do
      org.name
    else
      "Empty org"
    end
  end
end
