cask "ray" do
  version "3.2.10"
  sha256 "1f7b3b170fb16da009732193b41d738f077e3f54e5528d7e621bf4c8abbfef29"

  url "https://ray-app.s3.eu-west-1.amazonaws.com/ray-app-updates-v3/stable/ray-#{version}-latest-darwin-arm64.dmg"
  name "Ray"
  desc "Debug with Ray to fix problems faster"
  homepage "https://myray.app/"

  auto_updates true

  app "Ray.app"
end
