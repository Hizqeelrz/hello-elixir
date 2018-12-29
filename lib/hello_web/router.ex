defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :review_checks do
  #   plug :ensure_authenticated_user
  # end

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                              singleton: true

    # get "/hello", HelloController, :index
    # get "/hello/:messenger", HelloController, :show
    # get "/hello/:id", HelloController, :show
    # get "/hell", PageController, :show

    # get "/test", PageController, :test
    end

    scope "/cms", HelloWeb.CMS, as: :cms do
      pipe_through :browser

      resources "/pages", PageController
    end

  # scope "/", HelloWeb do
  #   get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  # end



  # resources "/users", UserController
  #
  # resources "/posts", PostController do
  #   resources "/comments", CommentController
  # end
  #
  # scope "/admin", HelloWeb.Admin, as: :admin do
  #   pipe_through :browser
  #
  #   resources "/reviews", ReviewController
  # end

  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
    pipe_through :api

    # resources "/review", ReviewController
    resources "/tweets", TweetController, except: [:new, :edit]

    resources "/transactions", TransactionController, except: [:new, :edit]
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end


end
