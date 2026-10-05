# frozen_string_literal: true

# The smallprint command, installed from its npm package. https://smallprint.dev/cli
class Smallprint < Formula
  desc "Lists the MCP servers and agent skills your agents run, and what changed"
  homepage "https://smallprint.dev"
  url "https://registry.npmjs.org/smallprint/-/smallprint-0.1.7.tgz"
  sha256 "892afa1c16e8c54b1e7aa7f45ba2be964377a19f03c01a0935228aeaa025f24f"
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
