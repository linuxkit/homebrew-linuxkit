require "language/go"

class Linuxkit < Formula
  desc "Lightweight Linux districution tool"
  homepage "https://github.com/linuxkit/linuxkit"
  head "https://github.com/linuxkit/linuxkit.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/linuxkit"
    ln_s buildpath, buildpath/"src/github.com/linuxkit/linuxkit"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    system "make", "local"

    bin.install "bin/linuxkit"
  end

  test do
    output = shell_output(bin/"moby version")
    assert_match "moby version", output
  end
end
