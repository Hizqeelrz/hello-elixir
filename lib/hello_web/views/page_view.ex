defmodule HelloWeb.PageView do
  use HelloWeb, :view

  # def render("index.html", assigns) do
  #   "rendering with assigns #{inspect Map.keys(assigns)}"
  # end

  def message do
    "Hello from the view"
  end

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloWeb.PageView, "page.json")}
    |> IO.inspect
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWeb.PageView, "page.json")}
    |> IO.inspect
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

  def handler_info(conn) do
    "Request Handled By: #{controller_module conn}.#{action_name conn}"
    |> IO.inspect
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
    |> IO.inspect
  end



end
