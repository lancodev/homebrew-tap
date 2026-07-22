class Strata < Formula
  desc "TUI database client for SQLite, MySQL/MariaDB, and PostgreSQL"
  homepage "https://github.com/lancodev/strata"
  url "https://github.com/lancodev/strata/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "53be4c049e7713b266fd8aa2d265fa7b5601e393dcc9ad0d57bea8e72b6e0343"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"strata", "./cmd/strata"
  end

  test do
    assert_match "strata #{version}", shell_output("#{bin}/strata --version")
  end
end
