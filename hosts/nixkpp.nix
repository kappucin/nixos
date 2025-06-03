{ config, lib, pkgs, modulesPath, ... }: {

  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      
    ];

  # \         /
  # /   MAIN  \
  # \         /

  # Nixpkgs config
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
 
  # Intel ucode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # \         /
  # /  DISKS  \
  # \         /

  # Main
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a6ae6838-7569-4005-ad40-fba1c7684782";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  # Home subvolume
  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/a6ae6838-7569-4005-ad40-fba1c7684782";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  # Nixos store
  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/a6ae6838-7569-4005-ad40-fba1c7684782";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  # Boot partition
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2701-328F";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  # 500GB Drive
  fileSystems."/media/source" =
    { device = "/dev/disk/by-uuid/7670D8C270D889EF";
      fsType = "ntfs";
    };

  # No swap
  swapDevices = [ ];

  # \         /
  # /   CFG   \
  # \         /

  # Network
  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Timezone
  time.timeZone = "Europe/Samara";

  # Locales
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "cyr-sun16";
    keyMap = "us";
  };

  # NVIDIA
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics.enable = true;
   hardware.nvidia =
    let
      # Preferred NVIDIA Version
      nvidiaPackage = config.boot.kernelPackages.nvidiaPackages.mkDriver{
        version = "575.57.08";
        sha256_64bit = "sha256-KqcB2sGAp7IKbleMzNkB3tjUTlfWBYDwj50o3R//xvI=";
        sha256_aarch64 = "sha256-VJ5z5PdAL2YnXuZltuOirl179XKWt0O4JNcT8gUgO98=";
        openSha256 = "sha256-DOJw73sjhQoy+5R0GHGnUddE6xaXb/z/Ihq3BKBf+lg=";
        settingsSha256 = "sha256-AIeeDXFEo9VEKCgXnY3QvrW5iWZeIVg4LBCeRtMs5Io=";
        persistencedSha256 = "sha256-Len7Va4HYp5r3wMpAhL4VsPu5S0JOshPFywbO7vYnGo=";

        patches = [ gpl_symbols_linux_615_patch ];
      };

      gpl_symbols_linux_615_patch = pkgs.fetchpatch {
        url = "https://github.com/CachyOS/kernel-patches/raw/914aea4298e3744beddad09f3d2773d71839b182/6.15/misc/nvidia/0003-Workaround-nv_vm_flags_-calling-GPL-only-code.patch";
        hash = "sha256-YOTAvONchPPSVDP9eJ9236pAPtxYK5nAePNtm2dlvb4=";
        stripLen = 1;
        extraPrefix = "kernel/";
      };
    in
    {
      package = nvidiaPackage;
      open = false;
    };

  # Mah account
  users = {
    users.kppcn = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
    };
    defaultUserShell = pkgs.fish;
  };

  # Plz dont touch this
  system.stateVersion = "25.05";

}
