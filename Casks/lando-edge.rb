cask "lando-edge" do
  version "3.1.4"
  sha256 "3369cf238c956bd12f421c56f110181cc981edeacd1743e1600feb9e991bdf45"

  url "https://github.com/lando/lando/releases/download/v#{version}/lando-v#{version}.dmg",
      verified: "github.com/lando/lando/"
  name "Lando Edge"
  homepage "https://docs.lando.dev/"

  conflicts_with cask: "lando"
  depends_on cask: "docker"

  pkg "LandoInstaller.pkg",
      choices: [
        {
          "choiceIdentifier" => "choiceDocker",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          "choiceIdentifier" => "choiceLando",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
      ]

  uninstall pkgutil: "io.lando.pkg.lando"
end
