class Climate < Formula
  desc "Generate auth-aware Go CLIs from OpenAPI specifications"
  homepage "https://disk0dancer.github.io/climate/"
  url "https://github.com/disk0Dancer/climate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "98e74f74e769f6248daf29552c202caa1d79c94fe0bbbf23a0f103dce36c3865"
  license "Apache-2.0"
  head "https://github.com/disk0Dancer/climate.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/disk0Dancer/climate/cmd/climate/commands.version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"climate"), "./cmd/climate"
  end

  test do
    assert_match "climate version v#{version}", shell_output("#{bin}/climate --version")
  end
end
