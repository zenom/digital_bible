defmodule DigitalBible.MixProject do
  use Mix.Project

  def project do
    [
      app: :digital_bible,
      version: "0.1.0",
      elixir: ">= 1.4.5",
      description: description(),
      package: package(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:tesla, "~> 1.2.1"},
      {:hackney, "~> 1.14.0"},
      {:ex_doc, "~> 0.19.2", only: :dev},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:exvcr, "~> 0.10", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end

  def description do
    """
    Library to interface with the digital bible platform
    """
  end

  defp package do
    [
      maintainers: ["zenom"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/zenom/digital_bible"}
    ]
  end
end
