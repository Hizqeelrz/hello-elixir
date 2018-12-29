defmodule Hello.Bank.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transactions" do
    field :amount, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :type])
    |> validate_required([:amount, :type])
  end
end
