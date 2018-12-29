defmodule Hello.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tweets" do
    field :author, :string
    field :body, :string
    field :likes, :integer
    field :retweets, :integer
    field :views, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:body, :author, :retweets, :likes, :views])
    |> validate_required([:body])
  end

  def views_changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:views])
    |> validate_required([:views])
  end


end
