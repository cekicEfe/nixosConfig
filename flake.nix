{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nix-alien.url = "github:thiagokokada/nix-alien";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = 
    {
      url="github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs,nixpkgs-stable,home-manager,nix-alien,nixvim, ... }@inputs: 
  let 
    system = "x86_64-linux" ;
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
	pkgs-stable = import nixpkgs-stable {
	  inherit system;
	  config.allowUnfree = true;
	};	
	  inherit inputs system;
	};
	modules = [
	  ./nixos/configuration.nix
	  inputs.nixvim.nixosModules.nixvim
	  inputs.home-manager.nixosModules.default
	  ({self,system,...}:{
	    environment.systemPackages = with self.inputs.nix-alien.packages.${system};
	    [
	      nix-alien
	    ];
	    programs.nix-ld.enable = true;
	  })
	];
    };
  
    homeConfigurations.nixy = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs{
	inherit system;
	config.allowUnfree = true;
      };
      modules = [
	inputs.nixvim.homeManagerModules.nixvim
	./nixos/users/home-manager-nixy/home.nix
	];
    };
  };
}
