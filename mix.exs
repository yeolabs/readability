defmodule Readability.Mixfile do
  @moduledoc """
  """

  @version "0.6.2"
  @description """
  Readability library for extracting and curating articles.
  """

  use Mix.Project

  def project do
    [app: :readability,
     version: @version,
     elixir: "~> 1.2",
     description: @description,
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger,
                    :floki,
                    :httpoison,
                    :fastimage
                   ]]
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
    [{:floki, ">= 0.14.0"},
     {:httpoison, ">= 0.12.0"},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:credo, "~> 0.3", only: [:dev, :test]},
     {:dialyxir, "~> 0.3", only: [:dev]},
     {:fastimage, git: "https://github.com/jonzlin95/fastimage.git"},
    ]
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "LICENSE*", "doc"],
     maintainers: ["Jaehyun Shin"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/keepcosmos/readability",
              "Docs" => "https://hexdocs.pm/readability/Readability.html"}]
  end
end
