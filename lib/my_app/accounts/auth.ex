defmodule MyApp.Accounts.Auth do
  use Ecto.Schema

  schema "auth" do
    field :username, :string
    field :hashed_password, :string
    timestamps(type: :utc_datetime)
  end
end
