{ config, pkgs, lib, ... }:
{
  options = with lib; {
    hello = mkOption {
      type = types.bool;
    };
  };
  config = {
    environment.systemPackages =
      if config.hello then [ pkgs.hello ]
      else [];
  };
}
