{ config, lib, pkgs,inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

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
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
    vscode
    btop
    bat
    mpv
    imv
    wiremix
    swaync 
    waybar
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    adwaita-fonts
  ];

  gtk = {
   enable = true;
   theme = {
     name = "Gruvbox-Dark";
     package = pkgs.gruvbox-gtk-theme;
   }; 
   iconTheme = {
     name = "Papirus-Dark";
     package = pkgs.papirus-icon-theme;
   };
   cursorTheme = {
     name = "Bibata-Modern-Ice";
     package = pkgs.bibata-cursors;
   };  
  };

  environment.variables = {
    XKB_DEFAULT_LAYOUT = "us";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    GTK_THEME = "Gruvbox-Dark";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}

