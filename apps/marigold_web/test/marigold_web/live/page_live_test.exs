defmodule MarigoldWeb.PageLiveTest do
  use MarigoldWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "User Search"
    assert render(page_live) =~ "User Search"
  end
end
