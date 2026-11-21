# frozen_string_literal: true

cask "fncaps" do
  version "0.9.3"
  sha256 "b87f9a8efbff32e758eda2f397608c47f0bf08e4b4bf5ce9f18b112312b10f78"

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
