defmodule MyApp.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :title, :string
      add :body, :text

      timestamps(type: :utc_datetime)
    end
  end
end
