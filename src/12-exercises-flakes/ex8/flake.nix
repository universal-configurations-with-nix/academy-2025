{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      callPackage = pkgs.callPackage;
    in
      {
        packages.${system} = {
          ts = callPackage ./ts.nix { };
          cloak = callPackage ./cloak.nix { };
          english_text_normalization = callPackage ./english_text_normalization.nix { };
        };

        apps.${system}.english_text_normalization = {
          type = "app";
          program = "${inputs.self.packages.${system}.english_text_normalization}/bin/norm-eng-cli";
        };

        # Това е единствената разлика с решението на задача 4
        overlays = {
          mypkgs = final: prev: {
            inherit (inputs.self.packages.${system}) ts cloak english_text_normalization;
          };
          acepe = final: prev: {
            ape = prev.ape.override {
              lexiconPath = "./ape.pl";
              pname = "acepe";
            };
          };
        };
      };
}
