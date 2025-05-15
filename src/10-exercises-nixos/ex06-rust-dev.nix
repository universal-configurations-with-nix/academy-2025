{ config, pkgs, lib, ... }:
{
  options = with lib; {
    rust-dev = mkOption {
      type = types.bool;
    };
  };
  config = {
    environment.systemPackages = lib.mkIf config.rust-dev (with pkgs; [
      rustc rustup cargo
    ]);
  };
}
