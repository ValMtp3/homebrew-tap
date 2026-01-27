class Chiffremento < Formula
  desc "File encryption and decryption cli tool in go (AES/ChaCha20)"
  homepage "https://github.com/ValMtp3/chiffremento-go-cli"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.1.0/chiffremento-darwin-arm64"
    sha256 "78914b260671719591b16b41ac5541071c7beb5a9b3f1068daaf8b945d07384e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.1.0/chiffremento-darwin-amd64"
    sha256 "c57860e2f98a02a8b7c8b26757429d25afd5c7463e72c6943fb4775e1058d4cb"
  elsif OS.linux?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.1.0/chiffremento-linux-amd64"
    sha256 "3e7c3f9ff14baeead922f856de82761fcf3e1659cf6658613e12905c6b4d979d"
  end

  def install
    bin.install "chiffremento-darwin-arm64" => "chiffremento" if OS.mac? && Hardware::CPU.arm?
    bin.install "chiffremento-darwin-amd64" => "chiffremento" if OS.mac? && Hardware::CPU.intel?
    bin.install "chiffremento-linux-amd64" => "chiffremento" if OS.linux?
  end

  test do
    system "#{bin}/chiffremento", "-help"
  end
end
