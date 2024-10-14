{
  description = "chikoyeat's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: { 
	nixosConfigurations = {
nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [ ./configuration.nix
	./modules/hyprland.nix 
	./modules/sound.nix
	./modules/networking.nix
	./modules/display-manager.nix
];
        # Optionally, use extraSpecialArgs to pass additional arguments to home.nix
        # extraSpecialArgs = { };
      };
    };
};
}
