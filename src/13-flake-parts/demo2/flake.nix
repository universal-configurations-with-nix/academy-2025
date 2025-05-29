{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ config, self, inputs, ... }: let

  in {
    systems = [ "x86_64-linux" "aarch64-linux" ];
    imports = [ ];

    flake = {
      top = "level";
      alo1 = config;
    };
    perSystem = { config, self', inputs', pkgs, ... }: {
      packages.hello = pkgs.hello;

      devShells.default = pkgs.mkShell {
        buildInputs = [ pkgs.hello pkgs.cowsay ];
      };

      legacyPackages = {
        inherit config self self' inputs inputs';
      };
    };
  });
}
