class StockPrice < Formula
  include Language::Python::Virtualenv

  desc "CLI to track stock prices and dividends"
  homepage "https://github.com/artback/stock-change"
  url "https://github.com/artback/stock-change.git", branch: "main"
  version "0.1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Ensure setuptools and pip are up to date in the venv
    venv.pip_install "setuptools", "pip"
    # Install the current project and its dependencies
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/stock-price", "--help"
  end
end
