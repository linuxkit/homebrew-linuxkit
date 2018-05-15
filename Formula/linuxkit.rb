class Linuxkit < Formula
  desc "Lightweight Linux distribution tool"
  homepage "https://github.com/linuxkit/linuxkit"
  url "https://github.com/linuxkit/linuxkit/archive/v0.4.tar.gz"
  sha256 "35ec1e552abaff9e3e93e0902fa7644ac781d505d27ecf0650a743869f6f5ad4"
  head "https://github.com/linuxkit/linuxkit.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/linuxkit"
    ln_s buildpath, buildpath/"src/github.com/linuxkit/linuxkit"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    system "make", "local-build"

    bin.install "bin/linuxkit"
  end

  test do
    output = shell_output(bin/"linuxkit version")
    assert_match "linuxkit version", output
  end
end
