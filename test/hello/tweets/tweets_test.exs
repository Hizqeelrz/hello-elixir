defmodule Hello.TweetsTest do
  use Hello.DataCase

  alias Hello.Tweets

  describe "tweets" do
    alias Hello.Tweets.Tweet

    @valid_attrs %{author: "some author", body: "some body", likes: 42, retweets: 42, views: 42}
    @update_attrs %{author: "some updated author", body: "some updated body", likes: 43, retweets: 43, views: 43}
    @invalid_attrs %{author: nil, body: nil, likes: nil, retweets: nil, views: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tweets.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Tweets.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Tweets.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Tweets.create_tweet(@valid_attrs)
      assert tweet.author == "some author"
      assert tweet.body == "some body"
      assert tweet.likes == 42
      assert tweet.retweets == 42
      assert tweet.views == 42
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tweets.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, tweet} = Tweets.update_tweet(tweet, @update_attrs)
      assert %Tweet{} = tweet
      assert tweet.author == "some updated author"
      assert tweet.body == "some updated body"
      assert tweet.likes == 43
      assert tweet.retweets == 43
      assert tweet.views == 43
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tweets.update_tweet(tweet, @invalid_attrs)
      assert tweet == Tweets.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Tweets.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Tweets.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Tweets.change_tweet(tweet)
    end
  end
end
