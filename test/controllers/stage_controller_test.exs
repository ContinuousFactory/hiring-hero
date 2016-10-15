defmodule Hiringhero.StageControllerTest do
  use Hiringhero.ConnCase

  alias Hiringhero.Stage
  @valid_attrs %{description: "some content", name: "some content", organisation_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, stage_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing stages"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, stage_path(conn, :new)
    assert html_response(conn, 200) =~ "New stage"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, stage_path(conn, :create), stage: @valid_attrs
    assert redirected_to(conn) == stage_path(conn, :index)
    assert Repo.get_by(Stage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, stage_path(conn, :create), stage: @invalid_attrs
    assert html_response(conn, 200) =~ "New stage"
  end

  test "shows chosen resource", %{conn: conn} do
    stage = Repo.insert! %Stage{}
    conn = get conn, stage_path(conn, :show, stage)
    assert html_response(conn, 200) =~ "Show stage"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, stage_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    stage = Repo.insert! %Stage{}
    conn = get conn, stage_path(conn, :edit, stage)
    assert html_response(conn, 200) =~ "Edit stage"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    stage = Repo.insert! %Stage{}
    conn = put conn, stage_path(conn, :update, stage), stage: @valid_attrs
    assert redirected_to(conn) == stage_path(conn, :show, stage)
    assert Repo.get_by(Stage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    stage = Repo.insert! %Stage{}
    conn = put conn, stage_path(conn, :update, stage), stage: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit stage"
  end

  test "deletes chosen resource", %{conn: conn} do
    stage = Repo.insert! %Stage{}
    conn = delete conn, stage_path(conn, :delete, stage)
    assert redirected_to(conn) == stage_path(conn, :index)
    refute Repo.get(Stage, stage.id)
  end
end
