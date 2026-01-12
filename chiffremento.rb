class Chiffremento < Formula
  desc "File encryption and decryption cli tool in go (AES/ChaCha20)"
  homepage "https://github.com/ValMtp3/chiffremento-go-cli"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.0.0/chiffremento-darwin-arm64.apple.silicon"
    sha256 "3d80278d618f227da251d233b77bc275e9dffa896b7d1f7e739176b03fbad0c3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.0.0/chiffremento-darwin-amd64.intel"
    sha256 "b58470b963f3e38ae1e1be5d5430490ecd498ed13e1c0d0a17e3776398e3ef4a"
  elsif OS.linux?
    url "https://github.com/ValMtp3/chiffremento-go-cli/releases/download/v1.0.0/chiffremento-linux-amd64"
    sha256 "f884952681fb9fbe8c8deb1a45fe05f6ea62c6c90889478d1a96acccdf56d771"
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
