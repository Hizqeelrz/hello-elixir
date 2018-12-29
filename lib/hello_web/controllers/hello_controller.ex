defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  # plug :assign_welcome_message, "Welcome Back" when action in [:index, :show]


  def index(conn, _params) do
    render conn, "index.html"
    # conn
    # |> put_resp_content_type("text/plain")
    # |> send_resp(201, "")
    # |> assign(:message, "Welcome Back!")
    # |> assign(:name, "Hizqeel")
    # |> render("index.html")
  end

  # def show(conn, %{"messenger" => messenger}) do
  #   render conn, "show.html", messenger: messenger
  # end

  # defp assign_welcome_message(conn, msg) do
  #   assign(conn, :message, msg)
  # end

  # def show(conn, %{"id" => id}) do
  #   # json conn, %{id: id}
  #   html conn, """
  #     <html>
  #       <head>
  #         <title>Passing an ID</title>
  #       </head>
  #       <body>
  #         <p>You send in id #{id}</p>
  #       </body>
  #     </html>
  #   """
  # end

  #----------------------------------------------------------------------------

  def show(conn, %{"id" => id}) do
    html conn, """
      <html>
        <head>
        <title> Passing id
          </title>
        </head>
        <body>
          <p> YOU send an id #{id}</p>
        </body>
      </html>
    """
  end
end
