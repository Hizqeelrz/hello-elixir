defmodule Hello.Repo.Migrations.AddLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float
      add :is_correct, :boolean, default: false
      add :created_by, :string
    end
  end
end
