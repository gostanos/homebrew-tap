# frozen_string_literal: true

# The smallprint command, installed from its npm package. https://smallprint.dev/cli
class Smallprint < Formula
  desc "Lists the MCP servers and agent skills your agents run, and what changed"
  homepage "https://smallprint.dev"
  url "https://registry.npmjs.org/smallprint/-/smallprint-1.0.0.tgz"
  sha256 "2128ba4f96c28c2400f8725670f843faa1f4dcac3d481869f3c6f4273062003a"
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
