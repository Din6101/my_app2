defmodule MyApp.Departments do
  alias MyApp.Repo
  alias MyApp.Accounts.Department

  def list_departments do
    Repo.all(Department)
  end
end
