{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";

  services.getty.autologinUser = "akbar";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  users.users.akbar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input"];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    foot
    kitty
    waybar
    swww
    git
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
  ];

 hardware.graphics.enable = true;
 services.xserver.videoDrivers = [ "nvidia" ];
 hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };
 hardware.nvidia.modesetting.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";

}

