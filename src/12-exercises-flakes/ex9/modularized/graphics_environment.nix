{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;

    # Премахнали сме xkb атрибута!
    # Вижте flake.nix за повече детайли.
  };
}
