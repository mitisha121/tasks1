defmodule Tasks1Web.SessionController do
    use Tasks1Web, :controller

    alias Tasks1.Accounts
    alias Tasks1.Accounts.User

    def create(conn, %{"name" => name}) do
        user = Accounts.get_user_by_name(name)
        if user do
            conn
            |> put_session(:user_id, user.id)
            |> put_flash(:info, "Welcome back, #{user.name}")
            |> redirect(to: "/feed")
        else
            conn
            |> put_flash(:error, "Can't create session")
            |> redirect(to: page_path(conn, :index))

        end
    end

    def delete(conn, _params) do
        conn
        |> delete_session(:user_id)
        |> put_flash(:info, "You have logged out.")
        |> redirect(to: page_path(conn, :index))
    end

end