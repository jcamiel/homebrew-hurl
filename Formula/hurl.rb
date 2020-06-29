class Hurl < Formula
  desc "Perform and tests HTTP session."
  homepage "https://hurl.dev"
  url "https://github.com/fabricereix/hurl/releases/download/0.99.10/hurl-0.99.10-x86_64-osx.tar.gz"
  sha256 "410f2b927ff0bd4b5921d167d909ad1b4dbad4d18aa0b06818b5ef504b3a6d28"


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
