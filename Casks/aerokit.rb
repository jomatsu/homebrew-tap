cask "aerokit" do
  version "0.3.0"
  sha256 "300cdfe2d2e9c03b2269299331b50e086a8e98372f1f480b24adedf64a5613cb"

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
