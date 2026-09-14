class Yabai < Formula
  desc "Tiling window manager for macOS based on binary space partitioning"
  homepage "https://github.com/kylekanderson/yabai"
  url "https://github.com/asmvik/yabai/releases/download/v7.1.25/yabai-v7.1.25.tar.gz"
  sha256 "76f383841570bfe1e3fd24cedd9b1a4b804b43b0f39c86a951c97d187fc6b1b4"
  head "https://github.com/kylekanderson/yabai.git", branch: "macos27"

  depends_on macos: :big_sur

  # NOTE: `make install` for HEAD builds needs `xcrun clang` from a full Xcode
  # install (not just the Command Line Tools) to link the arm64e slice used by
  # the scripting addition. There is no `depends_on xcode: :build` here because
  # Homebrew only accepts that dependency alongside a bottle/stable build path,
  # and this formula is expected to be built from HEAD.
  def install
    man.mkpath

    if build.head?
      system "make", "-j1", "install"
      system "codesign", "-fs", "-", "#{buildpath}/bin/yabai"
    end

    bin.install "#{buildpath}/bin/yabai"
    (pkgshare/"examples").install "#{buildpath}/examples/yabairc"
    (pkgshare/"examples").install "#{buildpath}/examples/skhdrc"
    man1.install "#{buildpath}/doc/yabai.1"
  end

  def caveats
    <<~EOS
      This is the macOS 27 patched fork (kylekanderson/yabai, branch macos27).
      Codesigning and the sudoers scripting-addition rule are handled by
      ~/.dotfiles/fresh.sh; re-run it after every `brew reinstall` here.
    EOS
  end

  test do
    assert_match "yabai-v#{version}", shell_output("#{bin}/yabai --version")
  end
end
