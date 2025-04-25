# Стъпки с които създадохме Cargo.lock файл
# 1. Клониране на хранилището
#
#    git clone https://github.com/allenap/rust-petname --branch v3.0.0-alpha.2
#
# 2. Влизаме в директорията
#
#    cd rust-petname
#
# 3. Влизаме в shell с налично cargo
#
#    nix-shell -p cargo
#
# 4. Генерираме Cargo.lock
#
#    cargo generate-lockfile
#
with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "petname";
  version = "3.0.0-alpha.2";

  src = fetchFromGitHub {
    owner = "allenap";
    repo = "rust-${name}";
    tag = "v${version}";
    hash = "sha256-aAlHEdkq27N+LHTSGzW2Yp9ApTDeUH/KufpsRkADvow=";
  };

  cargoHash = "sha256-fWI5ZEDkdwCq9AvgCucoZgFvkWhR4kGKVVSbmiTmP04=";

  # Това прави Cargo.lock наличен по време на теглене на Rust зависимости
  cargoLock.lockFile = ./ex06-petname-Cargo.lock;

  # Това прави Cargo.lock наличен по време на компилация
  postPatch = ''
    cp ${./ex06-petname-Cargo.lock} Cargo.lock
  '';
}
