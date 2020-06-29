class Hurl < Formula
  desc "Perform and tests HTTP session."
  homepage "https://hurl.dev"
  url "https://github.com/fabricereix/hurl/releases/download/0.99.11/hurl-0.99.11-x86_64-osx.tar.gz"
  sha256 "8321153e9da03aef54da7d02c28b2c4827e074c374c95f03c9b0967a0a19f2f1"


  def install
    bin.install "hurl"
    bin.install "hurlfmt"

    man1.install "hurl.1.gz"
    #man1.install "hurlfmt.1"
  end

  test do
    # Perform a GET request to https://hurl.dev.
    # This requires a network connection, but so does Homebrew in general.
    filename = (testpath/"test.hurl")
    filename.write "GET https://hurl.dev"
    system "#{bin}/hurl", "--color", filename
    system "#{bin}/hurlfmt", "--color", filename
  end
end
