defmodule MyApp.Content.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
