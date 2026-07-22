class Strata < Formula
  desc "TUI database client for SQLite, MySQL/MariaDB, and PostgreSQL"
  homepage "https://github.com/lancodev/strata"
  url "https://github.com/lancodev/strata/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "aa740b5d20427b6b10bdfd05a98b0244abd068ccca90a46da5d7f46947ae34db"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"strata", "./cmd/strata"
  end

  test do
    assert_match "strata #{version}", shell_output("#{bin}/strata --version")
  end
end
