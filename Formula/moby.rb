class Moby < Formula
  desc "Container assembly tool"
  homepage "https://github.com/moby/tool"
  head "https://github.com/moby/tool.git"

  depends_on "go" => :build

  def install
    system "make", "nogopath"

    bin.install "./dist/moby"
  end

  test do
    output = shell_output(bin/"moby version")
    assert_match "moby version", output
  end
end
