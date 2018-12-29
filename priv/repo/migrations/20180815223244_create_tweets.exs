defmodule Hello.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :body, :string
      add :author, :string
      add :retweets, :integer
      add :likes, :integer
      add :views, :integer

      timestamps()
    end

  end
end
