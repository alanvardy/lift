defmodule LiftWeb.PageController do
  use LiftWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
