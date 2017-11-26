class Hyperkit < Formula
  desc "Lightweight macOS hypervisor tool"
  homepage "https://github.com/moby/hyperkit"
  head "https://github.com/moby/hyperkit.git"

  def install
    system "make"

    bin.install "build/hyperkit"
  end

  test do
    output = shell_output(bin/"hyperkit -v")
    assert_match "hyperkit version", output
  end
end
