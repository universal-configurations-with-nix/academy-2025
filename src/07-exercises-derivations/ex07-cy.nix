with import <nixpkgs> { };
buildGoModule rec {
  name = "cy";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "cfoust";
    repo = name;
    tag = "v${version}";
    hash = "sha256-2qInkF5kUXKXlxyRpe3jZxxtfvkkIFly1m46UKzCjLs=";
  };

  vendorHash = null;

  buildInputs = [
    xorg.libX11
  ];

  doCheck = false;
}
