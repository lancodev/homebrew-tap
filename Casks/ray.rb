cask "ray" do
  version "3.2.10"
  sha256 "8965569f043c36bd7e12decfbb12db1511962b4e7edf423d05599d65c5ccc25a"

  url "https://ray-app.s3.eu-west-1.amazonaws.com/ray-app-updates-v3/stable/ray-#{version}-latest-darwin-arm64.dmg"
  name "Ray"
  desc "Debug with Ray to fix problems faster"
  homepage "https://myray.app/"

  auto_updates true

  app "Ray.app"
end
