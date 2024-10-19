{ config, pkgs, inputs, ... }:

{

  home.username = "chikoyeat";
  home.homeDirectory = "/home/chikoyeat";
  
  # Basic configuration
  home.stateVersion = "24.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    # Add your user-specific packages here
  ];

  # Program-specific configurations
  programs = {
    # Example: Configure git
    git = {
      enable = true;
      userName = "chikoYEAT";
      userEmail = "manavrj.07@gmail.com";
    };

    # Add other program configurations here
  };

  # Add other home-manager configurations here
}
