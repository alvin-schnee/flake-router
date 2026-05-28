{
	description = "Minimal NixOS router/dev setup";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	
		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    	let
      		system = "x86_64-linux";
    	in {
      		nixosConfigurations.router = nixpkgs.lib.nixosSystem {
        	inherit system;

        	modules = [
          		./hosts/router/configuration.nix

          		home-manager.nixosModules.home-manager
          		{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
            
            		home-manager.users.alvin = import ./home/alvin.nix;
          		}
      		];
    	};
  	};
}
