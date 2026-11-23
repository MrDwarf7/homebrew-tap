cask "example" do
  arch arm: "arm64", intel: "x64"

  version "0.0.0"

  # Keep checksums in architecture blocks so brew bump-cask-pr updates both.
  on_arm do
    sha256 "REPLACE_WITH_ARM64_SHA256"
  end
  on_intel do
    sha256 "REPLACE_WITH_INTEL_SHA256"
  end

  url "https://github.com/OWNER/REPO/releases/download/v#{version}/example-#{version}-darwin-#{arch}"
  name "Example"
  desc "Describe what the command does"
  homepage "https://github.com/OWNER/REPO"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on :macos
  container type: :naked

  binary "example-#{version}-darwin-#{arch}", target: "example"
end
