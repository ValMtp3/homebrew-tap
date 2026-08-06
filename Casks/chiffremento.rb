cask "chiffremento" do
  version "2.0.0"

  on_intel do
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v#{version}/chiffremento_#{version}_darwin_amd64.tar.gz"
    sha256 "e6678a632cd808a1137894d37096e3a5fb0331873789bd87f33d124c1bbae7c2"
  end
  on_arm do
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v#{version}/chiffremento_#{version}_darwin_arm64.tar.gz"
    sha256 "c78b31353a3835d6330747c00c9c2827b8203039135fd1de0dff1d4da07d9e6a"
  end

  name "chiffremento"
  desc "Outil de chiffrement de fichiers en ligne de commande"
  homepage "https://github.com/ValMtp3/chiffremento-go-cli"

  binary "chiffremento"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/chiffremento"]
  end
end
