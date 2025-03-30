with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "lorsrf";
  version = "latest";

  src = fetchFromGitHub {
    owner = "MindPatch";
    repo = "lorsrf";
    rev = "5c69453537664fde1de4db946c3d1c2c9e44ccbf";
    hash = "sha256-/bJT8RLEKjA5COG9pil8nQT0E7h88kmhVGccBJRHyHM=";
  };

  postPatch = ''
    cp ${./lorsrf-Cargo.lock} Cargo.lock
  '';

  cargoLock = {
    lockFile = ./lorsrf-Cargo.lock;
  };

  buildInputs = [ openssl.dev ];
  nativeBuildInputs = [ pkg-config ];
}
