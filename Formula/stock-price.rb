class StockPrice < Formula
  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.9"

  depends_on "python@3.12"

  def install
    # Create a real virtualenv manually to ensure pip is present
    system "python3.12", "-m", "venv", libexec
    
    # Use the venv's pip to install the package and its dependencies
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools"
    system libexec/"bin/pip", "install", "."
    
    # Link the binary
    bin.install_symlink libexec/"bin/stock-price"
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
