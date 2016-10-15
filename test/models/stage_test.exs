defmodule Hiringhero.StageTest do
  use Hiringhero.ModelCase

  alias Hiringhero.Stage

  @valid_attrs %{description: "some content", name: "some content", organisation_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Stage.changeset(%Stage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Stage.changeset(%Stage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
