defmodule HelloWeb.Plug.AuthenticateUser do
  use HelloWeb, :plug

  def authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> put_flash(:error, "Login required")
        |> redirect(to: "/")
        |> halt
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end
end
