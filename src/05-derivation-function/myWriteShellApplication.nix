with import <nixpkgs> { };
let
  myWriteShellApplication = { name, text, runtimeInputs ? [] }:
    derivation {
      system = "x86_64-linux";
      inherit name;

      builder = ./myWriteShellApplication.sh;
      args = [
        toybox bash
        name text
        (builtins.concatStringsSep
          ":"
          (map (i: i + "/bin") runtimeInputs))
      ];
    };
in
  myWriteShellApplication {
    name = "page_lines";
    runtimeInputs = [ curl cloc ];
    text = "curl -s \"$1\" | cloc --force-lang=html -";
  }
