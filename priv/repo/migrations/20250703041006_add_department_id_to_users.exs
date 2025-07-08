defmodule MyApp.Repo.Migrations.AddDepartmentIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :department_id, :integer
    end
  end
end
