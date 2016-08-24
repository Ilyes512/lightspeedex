defmodule Lightspeedex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :lightspeedex,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description,
      package: package,
      deps: deps,
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"}
    ]
  end

  defp description do
    """
    A (unofficial) SEOshop (Lightspeed) Elixir API client.
    """
  end

  defp package do
    [
      license: ["MIT"],
      keywords: ["Elixir", "SEOshop", "Lightspeed", "REST", "API", "HTTP"],
      maintainers: ["Ilyes Ahidar"],
      links: %{"GitHub" => "https://github.com/ilyes512/lightspeedex"}
    ]
  end
end
