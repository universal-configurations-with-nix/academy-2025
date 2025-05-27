{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  outputs = inputs:
    let
      system = "x86_64-linux";

      # Напомняме, nixpkgs е функция, с екцплитино скобуване този ред изглежда като:
      # ((import inputs.nixpkgs) { inherit system; })
      pkgs = import inputs.nixpkgs { inherit system; };

      callPackage = pkgs.callPackage;
    in
      {
        # Може ли legacyPackages, еквивалентно е
        packages.${system} = {
          # callPackage автоматично избира нужните зависимости от pkgs,
          # втория аргумент е главно за зависимости, извън nixpkgs
          ts = callPackage ./ts.nix { };
          cloak = callPackage ./cloak.nix { };
          english_text_normalization = callPackage ./english_text_normalization.nix { };
        };

        # Пускайки "nix run .#english_text_normalization" получаваме следната грешка:
        # error: unable to execute '/nix/store/...-english_text_normalization/bin/english_text_normalization': No such file or directory
        #
        # По подразбиране, Nix допуска че изпълнимият файл на програмата е със същото име като самата програма.
        # Това не е винаги така, поглеждайки в горепосочената bin директория виждаме изпълнимия файл "norm-eng-cli".
        #
        # Това е единият начин да оправим грешката, тоест да кажем на Nix, че програмата се казва по друг начин.
        # Вторият начин може да се намери в english_text_normalization.nix файла.
        apps.${system}.english_text_normalization = {
          type = "app";
          # Напомняме, inputs.self е специален аргумент, който е равен на върнатото атрибутно множество.
          # Можем да го мислим като експлицитен вариант на "rec".
          # Обяснявано е в модулната система, използва механизма на fix функцията.
          program = "${inputs.self.packages.${system}.english_text_normalization}/bin/norm-eng-cli";
        };
      };
}
