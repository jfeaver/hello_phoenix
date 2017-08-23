defmodule HelloWeb.Plug.LoadCurrentUser do
  use HelloWeb, :plug

  def load_current_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end
end
