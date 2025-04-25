with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "mandown";
  version = "latest";

  src = fetchFromGitLab {
    owner = "kornelski";
    repo = name;
    rev = "9da948761b48d81b88f991e314bd39f5fbe60834";
    hash = "sha256-wEv7h3Kl4EczmsY4FuGOvRgeGf0rgANhONhCKyu6zik=";
  };

  cargoHash = "sha256-CKeA5CJ+xLIzpFhPmyB3tU/hk3xVx4DlNtTm0wUmDWY=";
}
