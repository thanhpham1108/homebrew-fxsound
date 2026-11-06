cask "fxsound-mac" do
  version "0.1.3"
  sha256 "1b6f88402e6271bbf417f8e35c87b8178f3e2855b112b0926adf7e5714048caf"

  url "https://github.com/thanhpham1108/fxsound-macos-port/releases/download/v#{version}/FxSound-Mac-#{version}-arm64.zip"
  name "FxSound Mac"
  desc "System audio enhancement app based on FxSound"
  homepage "https://github.com/thanhpham1108/fxsound-macos-port"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FxSound Mac.app"

  uninstall quit: "dev.fxsound.port.app"

  zap trash: [
    "~/Library/Preferences/dev.fxsound.port.app.plist",
    "~/Library/Saved Application State/dev.fxsound.port.app.savedState",
  ]

  caveats <<~EOS
    This development preview is ad hoc signed and is not Apple-notarized.
    If macOS blocks the first launch, try opening the app once, then go to
    System Settings > Privacy & Security and choose Open Anyway.

    FxSound Mac requires System Audio Recording permission to process audio
    from other applications.
  EOS
end
