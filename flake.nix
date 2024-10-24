{
	description = "nixOS setup";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
    	};
	};

	outputs = { self, nixpkgs, home-manager, nixos-hardware, ...}@inputs: {

		nixosConfigurations = {
			
			lunix = nixpkgs.lib.nixosSystem {

			system = "x86_64-linux";
			modules = [

				# nixos-hardware.nixosModules.asus-zephyrus-ga401

				./configuration.nix
				home-manager.nixosModules.home-manager{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.dream = import ./home/default.nix;
				}
			];
		};
		
		};
	};
}
