class Hurl < Formula
  desc "Run and Test HTTP Requests."
  homepage "https://hurl.dev"
  url "https://github.com/Orange-OpenSource/hurl/releases/download/1.2.0/hurl-1.2.0-x86_64-osx.tar.gz"
  sha256 "0b483b5130dbf15fddeeb2e3a2cfcae1e1eb3ece5ac6b8622fcba28711733f94"
  
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
