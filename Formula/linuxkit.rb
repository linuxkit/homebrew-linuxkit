class Linuxkit < Formula
  desc "Lightweight Linux distribution tool"
  homepage "https://github.com/linuxkit/linuxkit"
  url "https://github.com/linuxkit/linuxkit/archive/v0.6.tar.gz"
  sha256 "bca9657ca1c23ce8e6909f11368da26726e330634d2db21ecaf77ff6bf8bda78"
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
