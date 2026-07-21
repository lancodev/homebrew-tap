class Strata < Formula
  desc "TUI database client for SQLite, MySQL/MariaDB, and PostgreSQL"
  homepage "https://github.com/lancodev/strata"
  url "https://github.com/lancodev/strata/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "f17aaa3973817f620439b67dbf1254b2ac750c7a2feb76dd4737aec8698952e5"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"strata", "./cmd/strata"
  end

  test do
    assert_match "strata #{version}", shell_output("#{bin}/strata --version")
  end
end
