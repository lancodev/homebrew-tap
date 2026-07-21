class Strata < Formula
  desc "TUI database client for SQLite, MySQL/MariaDB, and PostgreSQL"
  homepage "https://github.com/lancodev/strata"
  url "https://github.com/lancodev/strata/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "2fb36d07a4310fe043a4f3e7fc417afdac723ef1ea321c5d10578c0f7f3fa30b"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"strata", "./cmd/strata"
  end

  test do
    assert_match "strata #{version}", shell_output("#{bin}/strata --version")
  end
end
