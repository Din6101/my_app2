defmodule MyApp.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :title, :string
      add :description, :text
      add :appointment_date, :utc_datetime
      add :status, :string
      add :duration, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:appointments, [:user_id])
  end
end
