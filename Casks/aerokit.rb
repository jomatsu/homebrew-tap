cask "aerokit" do
  version "0.1.2"
  sha256 "9af5711743e096a3e6d71c5c6449b1d0ae7e09a4044849dbae29d6bec3ee7b4a"

  url "https://github.com/jomatsu/aerokit/releases/download/v#{version}/AeroKit-#{version}.zip"
  name "AeroKit"
  desc "AeroSpace companion with workspace switching, Exposé, and trackpad navigation"
  homepage "https://github.com/jomatsu/aerokit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AeroKit.app"
  binary "#{appdir}/AeroKit.app/Contents/MacOS/AeroKit", target: "aerokit"

  uninstall launchctl: "com.nasubikun.aerokit",
            quit:      "com.nasubikun.aerokit"

  zap trash: [
    "~/Library/Application Support/AeroKit",
    "~/Library/Caches/com.nasubikun.aerokit",
    "~/Library/LaunchAgents/com.nasubikun.aerokit.plist",
    "~/Library/Logs/AeroKit",
    "~/Library/Preferences/com.nasubikun.aerokit.plist",
    "~/Library/Saved Application State/com.nasubikun.aerokit.savedState",
  ]
end
