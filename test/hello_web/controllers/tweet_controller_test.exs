defmodule HelloWeb.TweetControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Tweets
  alias Hello.Tweets.Tweet

  @create_attrs %{author: "some author", body: "some body", likes: 42, retweets: 42, views: 42}
  @update_attrs %{author: "some updated author", body: "some updated body", likes: 43, retweets: 43, views: 43}
  @invalid_attrs %{author: nil, body: nil, likes: nil, retweets: nil, views: nil}

  def fixture(:tweet) do
    {:ok, tweet} = Tweets.create_tweet(@create_attrs)
    tweet
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tweets", %{conn: conn} do
      conn = get conn, tweet_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tweet" do
    test "renders tweet when data is valid", %{conn: conn} do
      conn = post conn, tweet_path(conn, :create), tweet: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tweet_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "author" => "some author",
        "body" => "some body",
        "likes" => 42,
        "retweets" => 42,
        "views" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tweet_path(conn, :create), tweet: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tweet" do
    setup [:create_tweet]

    test "renders tweet when data is valid", %{conn: conn, tweet: %Tweet{id: id} = tweet} do
      conn = put conn, tweet_path(conn, :update, tweet), tweet: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tweet_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "author" => "some updated author",
        "body" => "some updated body",
        "likes" => 43,
        "retweets" => 43,
        "views" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, tweet: tweet} do
      conn = put conn, tweet_path(conn, :update, tweet), tweet: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tweet" do
    setup [:create_tweet]

    test "deletes chosen tweet", %{conn: conn, tweet: tweet} do
      conn = delete conn, tweet_path(conn, :delete, tweet)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tweet_path(conn, :show, tweet)
      end
    end
  end

  defp create_tweet(_) do
    tweet = fixture(:tweet)
    {:ok, tweet: tweet}
  end
end
