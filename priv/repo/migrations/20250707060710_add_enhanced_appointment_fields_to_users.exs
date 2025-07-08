defmodule MyApp.Repo.Migrations.AddEnhancedAppointmentFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :appointment_notes, :text
      add :appointment_status, :string
      add :appointment_type, :string
      add :appointment_duration, :integer
      add :appointment_location, :string
      add :appointment_priority, :string
    end
  end
end
