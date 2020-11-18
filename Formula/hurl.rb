class Hurl < Formula
  desc "Run and Test HTTP Requests."
  homepage "https://hurl.dev"
  url "https://github.com/Orange-OpenSource/hurl/releases/download/0.99.14/hurl-0.99.14-x86_64-osx.tar.gz"
  sha256 "5021317009c56cc920f7cfaeeeec96898d37f878553ce073dbb91f79078f421f"


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
