# frozen_string_literal: true

cask "fncaps" do
  version "0.9.1"
  sha256 "64de7f65918f23d56d65186119a4764aca25874fabb3971cbdf08de28f204da3"

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
