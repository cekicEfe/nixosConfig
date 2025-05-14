{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    #nix-alien.url = "github:thiagokokada/nix-alien";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs-stable, nixvim, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        nixos = nixpkgs-stable.lib.nixosSystem {
          modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

      homeConfigurations.nixy =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nixvim.homeManagerModules.nixvim
            ./nixos/users/home-manager-nixy/home.nix
          ];
        };
    };
}
