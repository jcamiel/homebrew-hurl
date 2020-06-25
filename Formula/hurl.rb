class Hurl < Formula
  desc "Perform and tests HTTP session."
  homepage "https://hurl.dev"
  url "https://github.com/fabricereix/hurl/releases/download/0.99.9/hurl-0.99.9-x86_64-osx.tar.gz"
  sha256 "922900e7d85dfcd6f253323780ce5726a8d10e491248d9e038703bf32fde2dcd"


  def install
    bin.install "hurl"
    bin.install "hurlfmt"

    #man1.install "hurl.1"
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
