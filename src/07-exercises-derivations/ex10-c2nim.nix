with import <nixpkgs> { };
buildNimPackage rec {
  name = "c2nim";
  version = "0.9.19";

  src = fetchFromGitHub {
    owner = "nim-lang";
    repo = name;
    tag = version;
    hash = "sha256-E8sAhTFIWAnlfWyuvqK8h8g7Puf5ejLEqgLNb5N17os=";
  };
}
