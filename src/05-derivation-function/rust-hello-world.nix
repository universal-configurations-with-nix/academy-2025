with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "rust-hello-world";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "meta-rust";
    repo = "rust-hello-world";
    rev = "e0fa23f1a3cb1eb1407165bd2fc36d2f6e6ad728";
    hash = "sha256-xUyi1sgKhxvysMTS6tiSape+H4yHHLXjplAH4cD2Yb8=";
  };

  buildInputs = [ cargo ];

  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    mv target/release/rust-hello-world "$out/bin"
  '';
}
