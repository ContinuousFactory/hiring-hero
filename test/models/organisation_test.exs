defmodule Hiringhero.OrganisationTest do
  use Hiringhero.ModelCase

  alias Hiringhero.Organisation

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Organisation.changeset(%Organisation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Organisation.changeset(%Organisation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
