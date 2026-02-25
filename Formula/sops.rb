class Sops < Formula
  desc "Editor of encrypted files"
  homepage "https://github.com/peiliqiancdt/sops"
  version "3.12.1-acs-0.9"
  license "MPL-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/peiliqiancdt/sops/releases/download/v#{version}/sops-v#{version}.darwin.arm64"
      sha256 "a23721a5029e5adc9b079fd3e76bb80107294c7098cbb6e575a8a9f317debbdd"
    else
      url "https://github.com/peiliqiancdt/sops/releases/download/v#{version}/sops-v#{version}.darwin.amd64"
      sha256 "1bdb8bbd4456fd48e735ff1b586a089999f7474e8869709ed4e064460583c96a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/peiliqiancdt/sops/releases/download/v#{version}/sops-v#{version}.linux.arm64"
      sha256 "64b704314d1ce75e23cbf32bc9e6a4983e1d668799e45e739bf6e6c119b5a916"
    else
      url "https://github.com/peiliqiancdt/sops/releases/download/v#{version}/sops-v#{version}.linux.amd64"
      sha256 "8e290111baacff5d6ff625f6024674fed7c7e7a2111c6f5abad14bfcda459adb"
    end
  end

  def install
    bin.install "sops-v#{version}.#{OS.kernel_name.downcase}.#{Hardware::CPU.arch}" => "sops"
  end

  test do
    system "#{bin}/sops", "--version"
  end
end
