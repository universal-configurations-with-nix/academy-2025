with import <nixpkgs> { };
let
  myMkShell = { packages, shellHook ? "" }:
    stdenv.mkDerivation {
      name = "shell";
      src = ./.;

      inherit shellHook;
      nativeBuildInputs = packages;

      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p "$out"
      '';
    };
in
  myMkShell {
    packages = [ curl cloc ];
    shellHook = "echo Hi";
  }
