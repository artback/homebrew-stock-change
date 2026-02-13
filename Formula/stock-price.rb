class StockPrice < Formula
  include Language::Python::Virtualenv

  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.7"

  depends_on "python@3.12"

  def install
    # Create the virtualenv
    venv = virtualenv_create(libexec, "python3.12")
    
    # Use the venv's pip to install dependencies WITH their own dependencies
    # This bypasses Homebrew's default --no-deps behavior
    system libexec/"bin/pip", "install", "yfinance", "rich", "PyYAML", "python-dotenv"
    
    # Finally, install the tool itself
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
