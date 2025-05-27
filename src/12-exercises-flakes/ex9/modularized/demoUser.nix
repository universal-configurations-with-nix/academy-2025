{ config, pkgs, lib, ... }:
{
  options = with lib; {
    addDemoUser = mkOption {
      type = types.bool;
      description = "Whether to add a demonstration user";
      default = false;
    };
    demoUserName = mkOption {
      type = types.string;
      description = "The demo user's username";
      default = "demo";
    };
  };
  config = {
    users.users.${config.demoUserName} = lib.mkIf config.addDemoUser {
      isNormalUser = true;
      password = "demo";
    };
  };
}
