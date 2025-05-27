{ config, pkgs, lib, ... }:
with lib; {
  options = {
    rust-dev = mkOption {
      # Може и да се използва types.attrs, но тогава всички
      # проверки ще трябва да се правят ръчно
      #
      # Всеки атрибут на rust-dev зачитаме за модул
      # Всяка стойност на всеки атрибут трябва да бъде
      # атрибутно множество, с единствен атрибут enable
      # Тоест
      # rust-dev = {
      #   a = { enable = true; };
      #   b = { enable = false; };
      #   ...
      # };
      type = types.attrsOf (types.submodule {
        options.enable = mkOption {
          type = types.bool;
        };
      });
    };
  };
  config = {
    users.users =
      let
        userConf = {
          packages = with pkgs; [
            rustc rustup cargo
          ];
        };
      in
        builtins.mapAttrs
        (name: value: mkIf value.enable userConf)
        config.rust-dev;
  };
}
