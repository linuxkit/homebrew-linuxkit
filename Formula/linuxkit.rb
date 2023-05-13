class Linuxkit < Formula
  desc "Lightweight Linux distribution tool"
  homepage "https://github.com/linuxkit/linuxkit"
  url "https://github.com/linuxkit/linuxkit/archive/v1.0.1.tar.gz"
  sha256 "8a05ea89f0683852114ef312aae33ead8c65fccf6a0c13dd6d5096db972c68d1"
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
