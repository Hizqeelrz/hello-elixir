defmodule HelloWeb.TweetView do
  use HelloWeb, :view
  alias HelloWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      body: tweet.body,
      # author: tweet.author,
      # retweets: tweet.retweets,
      # likes: tweet.likes,
      views: tweet.views}
  end
end
