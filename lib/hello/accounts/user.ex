defmodule Hello.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Accounts.{User, Credential}


  schema "users" do
    field :first_name, :string
    field :last_name, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end

  def full_name(%User{first_name: first_name, last_name: last_name}) do
    "#{first_name} #{last_name}"
  end
end
