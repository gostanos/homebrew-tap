# frozen_string_literal: true

# The smallprint command, installed from its npm package. https://smallprint.dev/cli
class Smallprint < Formula
  desc "Lists the MCP servers and agent skills your agents run, and what changed"
  homepage "https://smallprint.dev"
  url "https://registry.npmjs.org/smallprint/-/smallprint-0.1.6.tgz"
  sha256 "40aec4ddeadf91b28793d448ed431da156e517d0e5d620aaf0c16b8124877b52"
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
