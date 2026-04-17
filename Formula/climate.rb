class Climate < Formula
  desc "Generate auth-aware Go CLIs from OpenAPI specifications"
  homepage "https://disk0dancer.github.io/climate/"
  url "https://github.com/disk0Dancer/climate/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "918c0e245eb366f873f81689961cb9cf459fd1c85269a526755939bfc2daa8d8"
  license "Apache-2.0"
  head "https://github.com/disk0Dancer/climate.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/disk0Dancer/climate/cmd/climate/commands.version=v0.1.2"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"climate"), "./cmd/climate"
  end

  test do
    assert_match "climate version v#{version}", shell_output("#{bin}/climate --version")
  end
end
