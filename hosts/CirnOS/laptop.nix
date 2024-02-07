{ config, ... }:
{
  # asusctl
  # services.asusd = {
  #   enable = true;
  #   enableUserService = true;
  # };

  # nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:3:0:0";
      amdgpuBusId = "PCI:5:0:0";
    };

    modesetting.enable = true;

    powerManagement = {
      enable = true;
      finegrained = true;
    };

    open = false;
    nvidiaSettings = false; # gui app
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
}
