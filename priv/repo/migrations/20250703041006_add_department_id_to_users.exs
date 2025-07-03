defmodule MyApp.Repo.Migrations.AddDepartmentIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :department_id, references(:departments, on_delete: :nothing)
    end
    create table(:departments) do
      add :name, :string

      timestamps()
    end


    ##create index(:users, [:department_id])
  end
end
