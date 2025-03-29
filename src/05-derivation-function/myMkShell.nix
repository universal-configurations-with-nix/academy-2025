with import <nixpkgs> { };
let
  myMkShell = { packages, shellHook ? "" }:
    derivation {
      system = "x86_64-linux";
      name = "shell";

      builder = ./myMkShell/builder.sh;
      stdenv = ./myMkShell;

      PACKAGES = (builtins.concatStringsSep
          ":"
          (map (i: i + "/bin") packages));
      HOOK = shellHook;
    };
in
  myMkShell {
    packages = [ curl cloc ];
    shellHook = "echo Hi";
  }
