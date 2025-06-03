{ pkgs, config, lib, ... }: {

  boot = {
    
    # Initrd
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    
    # Kernel modules
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    
    # Systemd-boot
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    
    # Kernel
    kernelPackages = pkgs.linuxPackages_latest;

  };

}
