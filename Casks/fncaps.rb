# frozen_string_literal: true

cask "fncaps" do
  version "0.9.2"
  sha256 "24a109adb931c6c4f7cb08bdb480867755b4b3650ee156a69c151ce0ba3b8f8f"

  url "https://github.com/Seo650/FnCaps/releases/download/v#{version}/FnCaps-#{version}.zip"
  name "FnCaps"
  desc "Switch between three or more input sources with fn and Caps Lock"
  homepage "https://github.com/Seo650/FnCaps"

  auto_updates true
  depends_on macos: :sonoma

  app "FnCaps.app"

  uninstall quit: "io.github.seo650.fncaps"

  zap trash: [
    "~/Library/Application Support/FnCaps",
    "~/Library/Preferences/io.github.seo650.fncaps.plist",
  ]

  caveats <<~EOS
    FnCaps is self-signed and not notarized by Apple. On first launch macOS will block it:
    open System Settings > Privacy & Security and click "Open Anyway".
    Accessibility permission is required. Updates are installed from inside the app.
    If Caps Lock stops working after a crash: hidutil property --set '{"UserKeyMapping":[]}'
  EOS
end
