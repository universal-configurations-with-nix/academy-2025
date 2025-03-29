with import <nixpkgs> { };
mkShell {
  packages = [ curl cloc ];
  shellHook = "echo Hi";
}
