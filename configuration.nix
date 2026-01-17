{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  networking.hostName = "linux";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tashkent";
  services.getty.autologinUser = "user";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  users.users.akbar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };
  programs.fish.enable = true;
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.tumbler.enable = true;
  hardware.bluetooth.enable = true;
  networing.firewall.enable = false;
  services.upower.enable = false;
  services.logind.settings.Login = {
    HandleSuspendKey = "ignore";
    HandleSuspendKeyLongPress= "ignore";
  };
  specialisation = {
  nvidia.configuration = {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.graphics.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.nvidia.open = false;
    hardware.nvidia.prime = {
        nvidiaBusId = "PCI:2:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    starship
    zoxide
    vim
    adw-bluetooth
    brave
    firefox
    wget
    curl
    kitty
    waybar
    git
    swww
    home-manager
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; 
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
}

