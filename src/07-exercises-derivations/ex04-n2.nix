with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "n2";
  version = "latest";

  src = fetchFromGitHub {
    owner = "evmar";
    repo = name;
    rev = "d67d508c389ac2e6961c6f84cd668f05ec7dc7b7";
    hash = "sha256-eWcN/iK/ToufABi4+hIyWetp2I94Vy4INHb4r6fw+TY=";
  };

  cargoHash = "sha256-ZUBYXAmf4vAvCaUO6Rn7ZPkmPa5AF28zx+mN1eL4OlI=";
}
