class StockPrice < Formula
  include Language::Python::Virtualenv

  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  
  # Point directly to the main branch of your repository
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
