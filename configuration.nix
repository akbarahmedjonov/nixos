{ config, lib, pkgs,inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  hardware.graphics.enable = true;
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };
  hardware.nvidia.modesetting.enable = true;

  time.timeZone = "Asia/Tashkent";

  services.displayManager.ly.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "input" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  networking.firewall.enable = false;
  services.tumbler.enable = true;
  services.gvfs.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball "https://github.com/PolyMC/PolyMC/archive/develop.tar.gz")).overlay
  ];


  environment.systemPackages = with pkgs; [
    polymc
    vim
    neovim
    wget
    git
    kitty
    fuzzel
    hypridle 
    hyprlock
    hyprsunset
    hyprpolkitagent
    yazi
    zathura
    #vscode
    btop
    bat
    mpv
    imv
    wiremix
    swaynotificationcenter
    waybar
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
    #adwaita-fonts
  ];

#  gtk = {
#   enable = true;
#   theme = {
#     name = "Gruvbox-Dark";
#     package = pkgs.gruvbox-gtk-theme;
#   }; 
#   iconTheme = {
#     name = "Papirus-Dark";
#     package = pkgs.papirus-icon-theme;
#   };
#   cursorTheme = {
#     name = "Bibata-Modern-Ice";
#     package = pkgs.bibata-cursors;
#   };  
#  };

  environment.variables = {
    XKB_DEFAULT_LAYOUT = "us";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    GTK_THEME = "Gruvbox-Dark";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}

