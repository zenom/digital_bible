defmodule DigitalBible.MixProject do
  use Mix.Project

  def project do
    [
      app: :digital_bible,
      version: "0.1.0",
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      deps: deps()
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
      {:poison, "~> 4.0"},
      {:httpoison, "~> 1.5"},
      {:ex_doc, "~> 0.19.2", only: :dev},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false}
    ]
  end

  def description do
    """
    Library to interface with the digital bible platform
    """
  end

  defp package do
    [ maintainers: ["zenom"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/zenom/digital_bible"} ]
  end
end
