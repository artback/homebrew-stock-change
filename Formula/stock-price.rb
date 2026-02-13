class StockPrice < Formula
  include Language::Python::Virtualenv

  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.8"

  depends_on "python@3.12"

  def install
    # 1. Create a clean virtualenv
    venv = virtualenv_create(libexec, "python3.12")
    
    # 2. Install the package and ALL dependencies into libexec
    # Using the venv's pip directly ensures dependencies (numpy, pandas, etc.) are installed.
    system libexec/"bin/pip", "install", ".", "--ignore-installed"
    
    # 3. Manually link the entry point into bin/
    bin.install_symlink libexec/"bin/stock-price"
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
