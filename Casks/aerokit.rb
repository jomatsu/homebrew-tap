cask "aerokit" do
  version "0.2.2"
  sha256 "02be048238e1bd0f960dd6c794a1845b536deb8c4089bfd8353a28988a4dc1e4"

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
