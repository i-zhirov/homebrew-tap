cask "windsurf-usage-systray" do
  version "1.0.0"
  sha256 "3e7a214b62fc48373115a521692b68edbfa97af5b1f7d777e4d07647b0de7029"

  url "https://github.com/i-zhirov/windsurf-usage-systray/releases/download/v#{version}/WindsurfUsageSystray.zip"
  name "Windsurf Usage Systray"
  desc "macOS menu bar app showing Windsurf quota in real time"
  homepage "https://github.com/i-zhirov/windsurf-usage-systray"

  app "WindsurfUsageSystray.app"

  zap trash: [
    "~/Library/Preferences/com.i-zhirov.windsurf-usage-systray.plist",
    "~/Library/Application Support/WindsurfUsageSystray",
  ]
end
