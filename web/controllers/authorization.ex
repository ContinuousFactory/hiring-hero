defmodule Hiringhero.Authorization do
  use Hiringhero.Web, :controller

  def handle_unauthorized(conn) do
    conn
    |> put_flash(:error, "Unauthorized access!")
    |> redirect(to: "/")
    |> halt
  end

  def handle_not_found(conn) do
    conn
    |> put_flash(:error, "Resource not found!")
    |> redirect(to: "/")
    |> halt
  end
end
