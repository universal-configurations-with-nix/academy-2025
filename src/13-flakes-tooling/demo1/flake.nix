{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ config, inputs, self, ... }: {
    systems = [ "x86_64-linux" "aarch64-linux" ];
    imports = [ ];

    flake = {
      top = "level";
      alo1 = config;
    };
    perSystem = { config, inputs', self', pkgs, ... }: {
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
