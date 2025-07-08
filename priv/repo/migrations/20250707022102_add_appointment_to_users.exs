defmodule MyApp.Repo.Migrations.AddAppointmentToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :appointment, :utc_datetime
    end
  end
end
