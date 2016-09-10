defmodule Hiringhero.UserView do
  use Hiringhero.Web, :view
  alias Hiringhero.User

  def first_name(%User{name: name}) do
    name
      |> String.split(" ")
      |> Enum.at(0)
  end
end
