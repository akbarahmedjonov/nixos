{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # This target is used by: home-manager switch --flake .#laptop
      homeConfigurations."laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        # This passes 'inputs' so home.nix can see zen-browser
        extraSpecialArgs = { inherit inputs; };

        modules = [ ./home.nix ];
      };

      # This target is used by: sudo nixos-rebuild switch --flake .#laptop
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
}
