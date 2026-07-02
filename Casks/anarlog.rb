cask "anarlog" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.4"
  sha256 arm:   "b23cfb69cf815b6fe4428c28314905205fd7680ebeed055acf266b705b349405",
         intel: "7317f3d9a8624028ab3e59e12687cc8f0e195524378ad9ba1b15e6c17b018b2d"

  url "https://github.com/fastrepl/anarlog/releases/download/desktop_v#{version}/hyprnote-macos-#{arch}.dmg",
      verified: "github.com/fastrepl/"
  name "Anarlog"
  desc "Open-source, local-first, privacy-first AI meeting notetaker"
  homepage "https://anarlog.so/"

  livecheck do
    url :url
    regex(/^desktop[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :sonoma

  app "Anarlog.app"
end
