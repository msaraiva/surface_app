defmodule MyDemoWeb.AppTest do
  use SurfaceAppWeb.ConnCase
  import Phoenix.LiveViewTest

  test "inital page", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "Surface App"
  end
end
