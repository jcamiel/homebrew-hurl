class Hurl < Formula
  desc "Run and Test HTTP Requests."
  homepage "https://hurl.dev"
  url "https://github.com/Orange-OpenSource/hurl/releases/download/1.1.0/hurl-1.1.0-x86_64-osx.tar.gz"
  sha256 "cbc9cef1ca50a6ee500c50bd001baaf6e236095400405fd6f3acacfa7a6419e4"

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
