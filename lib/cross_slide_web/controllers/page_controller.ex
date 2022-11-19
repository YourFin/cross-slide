defmodule CrossSlideWeb.PageController do
  use CrossSlideWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
