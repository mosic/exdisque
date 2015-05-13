defmodule ExDisque do
  @moduledoc """
  ExDisque wrapper
  """

  @doc """
  Connects to the Disque server:

  * `start_link`
  * `start_link("127.0.0.1", 7711)`

  Returns the `pid` of the connected client.
  """
  def start_link(host \\ "127.0.0.1", port \\ 7711, database \\ 0, password \\ "", reconnect \\ :no_reconnect) do
    :eredis.start_link(String.to_char_list(host), port, database, String.to_char_list(password), reconnect)
  end

  @doc """
  Disconnects from the Disque server:

  * `stop client`

  `client` is a `pid` returned from the `start_link`.
  """
  def stop(pid) when is_pid(pid) do
    :eredis.stop(pid)
  end

  @doc """
  Execute a query on the `client` with the given arguments.

  * `query client, ["ADDJOB", "queue_name", "job_body", "0"]`
  * `query client, ["GETJOB", "FROM", "queue_name"]`

  See more Disque command examples on the [Disque repo](https://github.com/antirez/disque#api).
  """
  def query(pid, command) when is_pid(pid) and is_list(command) do
    :eredis.q(pid, command) |> elem 1
  end
end
