with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "cloak";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "evansmurithi";
    repo = "cloak";
    rev = "refs/tags/v${version}";
    hash = "sha256-Pd2aorsXdHB1bs609+S5s+WV5M1ql48yIKaoN8SEvsg=";
  };

  cargoHash = "sha256-vnY54YCaBud9iY2cYtowjJIHo/ZWzIB1yaDnrQZoKH0=";
}
