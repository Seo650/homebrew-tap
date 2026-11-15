# frozen_string_literal: true

cask "fncaps" do
  version "0.9.0"
  sha256 "0a0acaf0138f73b46031b4027c614ad42ae7acb78a91f0412862ee01ed49a0d3"

  url "https://github.com/Seo650/FnCaps/releases/download/v#{version}/FnCaps-#{version}.zip"
  name "FnCaps"
  desc "Switch between three or more input sources with fn and Caps Lock"
  homepage "https://github.com/Seo650/FnCaps"

  auto_updates true
  depends_on macos: ">= :sonoma"

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
