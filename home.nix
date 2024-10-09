{ config, pkgs, ... }:

{
  home.username = "chikoyeat";
  home.homeDirectory = "/home/chikoyeat";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = [
  	pkgs.cowsay
  ];

	programs = {
	   carapace.enable = true;
	   carapace.enableNushellIntegration = true;

	   starship = { enable = true;
	       settings = {
		 add_newline = true;
		 character = { 
		 success_symbol = "[➜](bold green)";
		 error_symbol = "[➜](bold red)";
	       };
	    };
	  };
	};

}


