{ config, lib, pkgs, ... }: {

  # Sound
  services.pipewire = {
    enable = true;
    alsa = { 
     enable = true;
     support32Bit = true;
    };
    pulse.enable = true;
  };

  # SSH 
  services.openssh = { 
    enable = true;
  };

  # Tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.makeBinPath [pkgs.greetd.tuigreet]}/tuigreet --time";
        user = "greeter";
      };
    };
  };

  # XServer
  services.xserver.enable = true;

  # Polkit
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

}
