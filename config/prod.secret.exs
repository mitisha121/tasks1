use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :tasks1, Tasks1Web.Endpoint,
  secret_key_base: "H9yKYnao4VB+YSVbJoudKPG2oV5frePh+wo4Z/zQ8R8HCg/9VDOqFptjtsDG1VS6"

# Configure your database
config :tasks1, Tasks1.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tasktracker",
  password: "1rn13cs046",
  database: "tasks1_prod",
  pool_size: 15
