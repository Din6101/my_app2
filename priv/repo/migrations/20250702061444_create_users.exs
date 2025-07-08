defmodule MyApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :phone, :integer
      add :appointment, :string
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end
  end
end
