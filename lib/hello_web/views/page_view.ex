defmodule HelloWeb.PageView do
  use HelloWeb, :view

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloWeb.PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

  def welcome_user_message(conn) do
    if Map.has_key?(conn.assigns, :current_user) do
      render("welcome_user_message.html", user: conn.assigns.current_user)
    else
      ""
    end
  end
end
