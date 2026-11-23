cask "tcut-lite" do
  arch arm: "arm64", intel: "x64"

  version "1.4.7"

  on_arm do
    sha256 "4629ef15f5cee19ffd60e6e5f43dcf551c8a5842c5550adc4d424c91fbd91292"
  end
  on_intel do
    sha256 "dfd5e5d7ecd3a63857e4c88da1b3d58d0bfc928401df4496ec64252ef9eb9863"
  end

  url "https://github.com/AmanVarshney01/tcut/releases/download/v#{version}/tcut-#{version}-darwin-#{arch}"
  name "tcut Lite"
  desc "Record and render terminal sessions"
  homepage "https://github.com/AmanVarshney01/tcut"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  conflicts_with cask: "tcut"
  depends_on macos: :ventura
  container type: :naked

  binary "tcut-#{version}-darwin-#{arch}", target: "tcut"
end
