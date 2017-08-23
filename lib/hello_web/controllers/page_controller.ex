defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    pages = [%{title: "Mana Dorks"}, %{title: "Modern Staples"}]

    render(conn, :index, pages: pages)
  end

  def show(conn, _params) do
    page = %{title: "Mana Dorks"}

    render(conn, :show, page: page)
  end
end
