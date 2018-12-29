defmodule Hello.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :integer
      add :type, :string

      timestamps()
    end

  end
end
