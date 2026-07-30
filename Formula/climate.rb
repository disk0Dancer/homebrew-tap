class Climate < Formula
  desc "Generate auth-aware Go CLIs from OpenAPI specifications"
  homepage "https://disk0dancer.github.io/climate/"
  url "https://github.com/disk0Dancer/climate/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "be4c60777e5476e3d1bc88941e9ec3ff36c46cb557c3479a92dd89ab4d84157f"
  license "Apache-2.0"
  head "https://github.com/disk0Dancer/climate.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/disk0Dancer/climate/cmd/climate/commands.version=v0.1.6"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"climate"), "./cmd/climate"
  end

  test do
    assert_match "climate version v#{version}", shell_output("#{bin}/climate --version")
  end
end
