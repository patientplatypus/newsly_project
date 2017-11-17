defmodule Newsly.HealthCheck do
  use Newsly.Web, :controller

  def index(conn, _params) do
    send_resp(conn, :ok, ""
  end


end
