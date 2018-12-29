defmodule HelloWeb.TweetController do
  use HelloWeb, :controller

  alias Hello.Tweets
  alias Hello.Tweets.Tweet

  action_fallback HelloWeb.FallbackController

  def index(conn, _params) do
    tweets = Tweets.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  # !important
  # to create with the json api from frontend javascript we will first see that does the map have the key tweet or vice verse than match the value then the fetch will work accordingly
  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Tweets.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Tweets.get_tweet!(id)
    {:ok, tweet} = Tweets.update_tweet_views(tweet, %{"views" => tweet.views + 1})
    render(conn, "show.json", tweet: tweet)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Tweets.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Tweets.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Tweets.get_tweet!(id)
    with {:ok, %Tweet{}} <- Tweets.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
end
