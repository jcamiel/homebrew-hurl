class Hurl < Formula
  desc "Perform and tests HTTP session."
  homepage "https://hurl.dev"
  url "https://github.com/fabricereix/hurl/releases/download/0.99.10/hurl-0.99.10-x86_64-osx.tar.gz"
  sha256 "f393ffa8c171da0f1486d5e45de9f4d30b92cc3db1d64360a1723d1071d2e6a7"


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
