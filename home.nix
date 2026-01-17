{ config, pkgs, ... }:
#let
#  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
#  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
#  configs = {
#    hypr = "hypr";
#    nvim = "nvim";
#    wofi = "wofi";
#    rofi = "rofi";
#    foot = "foot";
#    waybar = "waybar";
#  };
#in
{
  imports = [
#    ./modules/theme.nix
  ];

  backupFileExtension = "backup";
  home.username = "akbar";
  home.homeDirectory = "/home/akbar";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprsunset
    hyprshot
    hyprpolkitagent
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    nitch
    rofi
    pcmanfm
#    (pkgs.writeShellApplication {
#      name = "ns";
#      runtimeInputs = with pkgs; [
#        fzf
#        (nix-search-tv.overrideAttrs {
#          env.GOEXPERIMENT = "jsonv2";
#        })
#      ];
#      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
#    })
#  ];
#  xdg.configFile = builtins.mapAttrs
#    (name: subpath: {
#      source = create_symlink "${dotfiles}/${subpath}";
#      recursive = true;
#    })
#    configs;
  ];
}
