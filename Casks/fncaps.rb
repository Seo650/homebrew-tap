# frozen_string_literal: true

cask "fncaps" do
  version "0.9.4"
  sha256 "c09c4a863acb9c50689ae3b87b3a6ada8e294a4a6e1660c5e4e77a5be303082e"

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
