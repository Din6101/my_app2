defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :hashed_password, :string
    field :name, :string
    field :age, :integer
    field :phone, :integer
    field :appointment, :utc_datetime
    field :appointment_notes, :string
    field :appointment_status, :string
    field :appointment_type, :string
    field :appointment_duration, :integer
    field :appointment_location, :string
    field :appointment_priority, :string
    belongs_to :department, MyApp.Accounts.Department
    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => any(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :age,
      :phone,
      :appointment,
      :appointment_notes,
      :appointment_status,
      :appointment_type,
      :appointment_duration,
      :appointment_location,
      :appointment_priority,
      :department_id
    ])
    |> validate_required([:name, :age, :phone])
    |> foreign_key_constraint(:department_id)
  end
end
