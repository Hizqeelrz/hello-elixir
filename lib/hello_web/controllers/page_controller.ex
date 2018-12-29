defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome Back"

  def index(conn, _params) do
    render conn, "index.html"
  end

  # def index(conn, _params) do
  #   pages = [%{title: "bar"}, %{title: "foo"}]
  #   render conn, "index.json", pages: pages
  # end
  #
  # def show(conn, _params) do
  #   page = %{title: "baz"}
  #   render conn, "show.json", page: page
  # end




  # def index(conn, _params) do
  #   conn
    # |> assign(:message, "Welcome Forward!")
    # |> assign(:name, "Tom Cruise")
    # |> put_status(:not_found) #aka 404
    # |> put_view(HelloWeb.ErrorView)
    # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    # |> send_resp(201, "")
    # |> redirect(external: "hhtps://elixir-lang.org")
    # |> IO.inspect
    # |> render("index.html")
    # render conn, "index.html"

    # conn
    # |> put_status(:not_found)
    # |> put_view(HelloWeb.ErrorView)
    # |> render("index.html")

    # render conn, "index.text", message: params["message"]

    # conn
    # |> put_layout("admin.html")
    # # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    # # |> put_flash(:error, "Heyyy, Let's pretend we have an error.")
    # |> render("index.html")
  # end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end

  # def redirect_test(conn, _params) do
  #   text conn, "Redirect!"
  # end


  #----------------------------------------------------------------------------


end
