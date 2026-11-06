cask "fxsound-mac" do
  version "0.1.2"
  sha256 "1692ea07fde763ffd3129591609c7a1d40d408fffe986520bae7442c86649c7b"

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
