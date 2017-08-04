require "language/go"

class ManifestTool < Formula
  desc "Multi arch registry tool"
  homepage "https://github.com/estesp/manifest-tool"
  head "https://github.com/estesp/manifest-tool.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/estesp"
    ln_s buildpath, buildpath/"src/github.com/estesp/manifest-tool"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    system "make binary"

    bin.install "manifest-tool"
  end

  test do
    output = shell_output(bin/"manifest-tool --version")
    assert_match "manifest-tool version", output
  end
end
