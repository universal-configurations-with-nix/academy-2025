{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    naj-dobriq-flake = {
      url = "path:/home/kamen/Programming/GitHub-repos/academy-2025/src/12-exercises-flakes/ex4";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (
    { config, inputs, self, lib, withSystem, ... }: {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      imports = [
        ./banici.nix
      ];

      debug = true;

      flake = {
        top = "level";
      };

      perSystem = { config, inputs', self', pkgs, system, ... }: {
        legacyPackages = {
          inherit inputs' self';
        };

        packages.hello = pkgs.hello;

        devShells.default = pkgs.mkShell { buildInputs = [ pkgs.hello ]; };
      };
   });
}
