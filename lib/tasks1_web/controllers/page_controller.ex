defmodule Tasks1Web.PageController do
  use Tasks1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def manage(conn, _params) do
    current_user = conn.assigns[:current_user]
    managers = Tasks1.Accounts.list_managers()
    changeset = Tasks1.Accounts.change_manager(%Tasks1.Accounts.Manager{})
    managerr = Tasks1.Accounts.get_managerr(current_user.id)
    managees = Tasks1.Accounts.get_managee(current_user.id)
    tasks = Tasks1.Social.list_tasks()
    render conn, "manage.html", managers: managers, changeset: changeset, managerr: managerr, managees: managees, tasks: tasks
  end

  def feed(conn, _params) do
    tasks = Tasks1.Social.list_tasks()
    current_user = conn.assigns[:current_user]
    changeset = Tasks1.Social.change_task(%Tasks1.Social.Task{})
    managees = Tasks1.Accounts.get_managee(current_user.id)
    render conn, "feed.html", tasks: tasks, changeset: changeset, managees: managees
  end

end
