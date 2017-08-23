defmodule HelloWeb.SessionController do
  use HelloWeb, :controller

  alias Hello.Accounts

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome Back")
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> redirect(to: page_path(conn, :index))
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Bad email or password")
        |> redirect(to: session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end
end
