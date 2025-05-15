{ config, pkgs, lib, ... }:
with lib; {
  options = {
    enable = mkOption {
      type = types.bool;
    };
    locations = mkOption {
      # Приемливо е и типа да бъде `types.listOf types.str`
      # Но по този начин модулната система ще направи проверка за стойността
      type = types.listOf (types.enum [ "Sofia" "Paris" "London" ]);
    };
  };
  config = {
    time.timeZone =
      let
        first = builtins.head config.locations;
      in
        # Всички градове са в европа, можем да си позволим това:
        mkIf config.enable ("Europe/" + first);

    services.xserver.xkb = mkIf config.enable {
      options = "grp:alt_shift_toggle"; # Смяна на език с Alt+Shift
      layout =
        let
          # Превръща [ "Sofia" "Paris" "London" ] в [ "bg" "fr" "gb" ]
          keyboards = builtins.map
            (l:      if l == "Sofia"  then "bg"
                else if l == "Paris"  then "fr"
                else if l == "London" then "gb"
                else "")
            config.locations;
        in
          builtins.concatStringsSep "," keyboards;
    };

    i18n.defaultLocale =
      let
        last = lib.last config.locations;
        locale =
               if last == "Sofia"  then "bg_BG"
          else if last == "Paris"  then "fr_FR"
          else if last == "London" then "en_GB"
          else "";
      in
        mkIf config.enable (locale + ".UTF8");
  };
}
