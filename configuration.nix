{ config, pkgs, pkgs-unstable, ghostty, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import ./modules/packages.nix { inherit config pkgs pkgs-unstable ghostty; })
    ];

   nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.8-env"
  ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };  

services.displayManager.defaultSession = "none+i3";
  services.upower.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;  # Uncomment if you want to use JACK applications
  };

  # Syncthing configuration
  services.syncthing = {
    enable = true;
    user = "chikoyeat";
    dataDir = "/home/chikoyeat/Documents";
    configDir = "/home/chikoyeat/Documents/.config/syncthing";
  };

  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };  

  xdg.portal.config.common.default = "*";

  # Enable Flatpak
  services.flatpak.enable = true;

  # Define user account
  users.users.chikoyeat = {
    isNormalUser = true;
    description = "Manav";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  # Enable Firefox
  programs.firefox.enable = true;



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  environment.etc = {
    "gitconfig".text = ''
      [user]
        name = chikoYEAT
        email = manavrj.07@gmail.com
      [core]
        editor = vim
    '';
  }; 

  # Enable Thunar file manager
  programs.thunar.enable = true;
  programs.dconf.enable = true;

  virtualisation.docker.enable = true;

  hardware.bluetooth = {
    enable = true;
  };

  system.stateVersion = "24.05"; 
  fonts = {
	    packages = with pkgs; [
	      ibm-plex
        sarasa-gothic
	      material-design-icons
	      noto-fonts-cjk-sans
        dejavu_fonts
	      iosevka  # Use the installed package
	    ];

	    enableDefaultPackages = true;

	    fontconfig = {
	      enable = true;
	      defaultFonts = {
		monospace = [ "Sarasa Gothic" ];
		sansSerif = [ "IBM Plex Sans" ];
		serif = [ "IBM Plex Serif" ];
	      };
	    };
	  };  
}
  
  
