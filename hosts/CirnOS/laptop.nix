{ config, pkgs, ... }:
{
  systemd.services.battery-charge-threshold =
    let
      CHARGE_THRESHOLD = "80";
    in
    {
      enable = true;
      description = "Set the battery charge threshold";
      startLimitBurst = 0;
      after = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/echo ${CHARGE_THRESHOLD} > /sys/class/power_supply/BATT/charge_control_end_threshold'";
        # ...
      };
      wantedBy = [ "multi-user.target" ];
      # ...
    };

  # nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true;
  #     };
  #     nvidiaBusId = "PCI:3:0:0";
  #     amdgpuBusId = "PCI:5:0:0";
  #   };

  #   modesetting.enable = true;

  #   powerManagement = {
  #     enable = true;
  #     finegrained = true;
  #   };

  #   open = false;
  #   nvidiaSettings = false; # gui app
  #   package = config.boot.kernelPackages.nvidiaPackages.latest;
  # };
}
