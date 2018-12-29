defmodule Hello.Accounts.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :latitude, :float
    field :longitude, :float
    field :is_correct, :boolean, default: false
    field :created_by, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :latitude, :longitude, :created_by])
    |> validate_required([:name])
  end

  def is_correct_changeset(location, attrs) do
    location
    |> cast(attrs, [:is_correct])
  end
end
