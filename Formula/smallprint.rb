# frozen_string_literal: true

# The smallprint command, installed from its npm package. https://smallprint.dev/cli
class Smallprint < Formula
  desc "Lists the MCP servers and agent skills your agents run, and what changed"
  homepage "https://smallprint.dev"
  url "https://registry.npmjs.org/smallprint/-/smallprint-0.1.5.tgz"
  sha256 "ba16ec39e6a0545f1dd646ec4950c47c1a06fb4842ca2267f898b099c68ef0e2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/smallprint --version").strip
    assert_match "smallprint check --locked", shell_output("#{bin}/smallprint --help")
  end
end
