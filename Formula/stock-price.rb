class StockPrice < Formula
  include Language::Python::Virtualenv

  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.5"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "yfinance"
    venv.pip_install "rich"
    venv.pip_install "PyYAML"
    venv.pip_install "python-dotenv"
    venv.pip_install_and_link buildpath
  end
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
