defmodule ExDisque.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exdisque,
      version: "0.0.1",
      elixir: "~> 1.0",
      name: "exdisque",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Elixir client library for Disque: https://github.com/antirez/disque"
    ]
  end

  def application do
    []
  end

  defp deps do
    [{:eredis, "~> 1.0"}]
  end

  defp package do
    [
      contributors: ["Miloš Mošić"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mosic/exdisque"}
    ]
  end
end
