{ config, pkgs, lib, ... }:
with lib; {
  options = {
    vhosts = mkOption {
      type = types.attrs;
    };
  };
  config = mkIf (config.vhosts != { }) {
    environment.systemPackages = [ pkgs.apacheHttpd ];

    services.httpd = {
      enable = true;
      virtualHosts = config.vhosts;
    };

    networking.extraHosts = "127.0.0.1 " +
      (builtins.concatStringsSep
        " "
        (builtins.map
          (value: value.hostName or "")
          (builtins.attrValues config.vhosts)));
  };
}
