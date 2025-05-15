{ config, pkgs, lib, ... }:
with lib; {
  options = {
    vhosts = mkOption {
      type = types.attrs;
    };
  };
  config = mkIf (config.vhosts != { }) (let
    hostNames = builtins.concatStringsSep
      " "
      (builtins.map
        (value: value.hostName or "")
        (builtins.attrValues config.vhosts));
  in {
    environment.systemPackages = [ pkgs.apacheHttpd ];

    services.httpd = {
      enable = true;
      virtualHosts = config.vhosts;
    };

    networking.extraHosts = "127.0.0.1 " + hostNames;

    systemd.services.vhost-ping = {
      wantedBy = [ "network.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = 60 * 10;
        # Трябва да е на един ред, заради начина по който systemd сървиси се обработват
        ExecStart = "${pkgs.bash}/bin/bash -c 'for h in ${hostNames}; do ${pkgs.toybox}/bin/ping -c 3 $h || exit 1; done'";
      };
    };
  });
}
