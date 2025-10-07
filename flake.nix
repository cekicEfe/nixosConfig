{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-oldstable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixpkgs-oldstable, nixvim
    , home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        laptop1 = nixpkgs-stable.lib.nixosSystem {
          modules = [
            #
            ./laptop1
            inputs.home-manager.nixosModules.default
          ];
        };

        desktop1 = nixpkgs-stable.lib.nixosSystem {
          modules = [
            #
            ./desktop1
            inputs.home-manager.nixosModules.default
          ];
        };

      };

      homeConfigurations.nixy =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nixvim.homeManagerModules.nixvim
            ./common/users/home-manager-nixy/home.nix
          ];
        };
    };
}
