require "language/go"

class Rtf < Formula
  desc "Regression testing framework"
  homepage "https://github.com/linuxkit/rtf"
  head "https://github.com/linuxkit/rtf.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/linuxkit"
    ln_s buildpath, buildpath/"src/github.com/linuxkit/rtf"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    system "make"

    bin.install "rtf"
  end

  test do
    output = shell_output(bin/"rtf version")
    assert_match "rtf version", output
  end
end
