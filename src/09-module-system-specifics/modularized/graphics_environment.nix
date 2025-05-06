{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;

    xkb = {
      layout = "us,bg";                 # Английска и българска клавиатура
      variant = ",phonetic";            # QWERTY и ЯВЕРТЪ варианти
      options = "grp:alt_shift_toggle"; # Смяна на език с Alt+Shift
    };
  };
}
