with import <nixpkgs> { };
with python3Packages;
buildPythonApplication rec {
  name = "rpi-backlight";
  version = "2.7.0";

  src = fetchFromGitHub {
    owner = "linusg";
    repo = "rpi-backlight";
    rev = "refs/tags/v${version}";
    hash = "sha256-KzuZJH+z8l9aaYiOgtmKJL6A4xlX4ytD3AkHGrE7Bkw=";
  };

  build-system = [ setuptools ];
}
