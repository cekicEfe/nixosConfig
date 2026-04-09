{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-oldstable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixpkgs-oldstable, home-manager
    , ... }@inputs:
    let

      system = "x86_64-linux";

      pkgs = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      specialArgs = {
        inherit inputs;
        used_terminal = "alacritty";
        emacs_theme = "catppuccin";
      };

    in {
      nixosConfigurations = {
        laptop1 = nixpkgs-stable.lib.nixosSystem {
          specialArgs = specialArgs;
          modules = [
            #
            ./laptop1
            inputs.home-manager.nixosModules.default
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };

        desktop1 = nixpkgs-stable.lib.nixosSystem {
          specialArgs = specialArgs;
          modules = [
            #
            ./desktop1
            inputs.home-manager.nixosModules.default
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };
      };

      homeConfigurations = {
        "nixy" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = specialArgs;
          modules = [ ./common/users/home-manager-nixy/home.nix ];
        };
      };

    };
}
