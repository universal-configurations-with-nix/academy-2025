# Стъпки с които създадохме deps.json файл
# 1. Клониране на хранилището
#
#    git clone https://github.com/jiro4989/nimtetris --branch v1.2.0
#
# 2. Влизаме в директорията
#
#    cd nimtetris
#
# 3. Влизаме в shell с налично nim_lk
#
#    nix-shell -p nim_lk
#
# 4. Генерираме deps.json
#
#    nim_lk ./nimtetris.nimble > deps.json
#
with import <nixpkgs> { };
buildNimPackage rec {
  name = "tetris";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "jiro4989";
    repo = "nim${name}";
    rev = "v${version}";
    hash = "sha256-XLfMxJIAR/CF0Uk9ZubwYLl2bxPQXIyIog0iYtOMyR8=";
  };

  lockFile = ./ex12-tetris-deps.json;
}
