{ config, pkgs, inputs, ... }:

{
  
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
     inputs.zen-browser.packages.${pkgs.system}.default
     libnotify
     nvtopPackages.nvidia
     swww
     pavucontrol
     vscode
     zellij
     bibata-cursors
     telegram-desktop
     adw-gtk3
     papirus-icon-theme
     nwg-look
     unzip
     zip
     wl-clipboard
     hypridle
     hyprlock
     hyprsunset
     hyprpolkitagent
     swaynotificationcenter
     brightnessctl
     fastfetch
     waypaper
     imagemagick
     manim
     uv
     pipx
     zoxide
     fuzzel
     nixd
     lua-language-server
     gcc
     ripgrep
     nautilus
     file-roller
     vscode-css-languageserver
     htmx-lsp2
     imv
     mpv
     wf-recorder
     kdePackages.kdenlive
     onlyoffice-desktopeditors
     microfetch
     nerdfetch
     pfetch
     neofetch
     zed-editor
     wiremix
     lazygit
     gzip
     hyprshot
     yt-dlp
     gnome-sound-recorder
     cmatrix
     cava
     pipes
     asciiquarium-transparent
     eza
     cliphist
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

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
    font = {
      name = "JetBrains Mono Regular";
      size = 11;
    };
  };

  programs.home-manager.enable = true;
}
