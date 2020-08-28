class Hurl < Formula
  desc "Perform and tests HTTP session."
  homepage "https://hurl.dev"
  url "https://github.com/Orange-OpenSource/hurl/releases/download/0.99.12/hurl-0.99.12-x86_64-osx.tar.gz"
  sha256 "0345fdb29a4a42ada6c2c9f3d65949a7575bce541e56628f964fa623e949eef5"


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
