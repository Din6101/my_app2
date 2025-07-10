defmodule MyApp.Repo.Migrations.AddUsernameAndHashedPasswordToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string
      add :hashed_password, :string
    end

    create unique_index(:users, [:username])
  end
end
