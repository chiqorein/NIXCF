{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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
    user = "chikoyeat";  # Changed from "myusername" to match your actual username
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
    shell = pkgs.zsh;
  };

  # Enable Firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    alacritty
    i3
    dmenu
    (lua.withPackages(ps: with ps; [ busted luafilesystem ]))
    git
pkgs.gnome-keyring
cudatoolkit 
    nerdfonts
    networkmanagerapplet
    nitrogen
    pasystray
    picom
    maim
    xclip
    xdotool
    polkit_gnome
    pulseaudioFull
mkdocs
zip
maven
iosevka
pkgs.libngspice
    vscode
    rofi
pkgs.deno
octaveFull
home-manager
    vim
android-studio
    curl
    unrar
pkgs.lshw
    bun
obs-studio
    zed
    unzip
pkgs.libsForQt5.kdenlive
    brightnessctl
    neofetch
    zsh
    oh-my-zsh
    zsh-completions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
pkgs.libngspice
pkgs.gwe

pkgs.go
    zsh-history-substring-search
    dunst
cargo-tauri
tree
rustc
nodejs_22
pacman
python311Packages.pip
docker
cargo
pkgs.gccgo14
  pkg-config
  gtk3
pkgs.davinci-resolve
pkgs.ngspice
pkgs.nvtopPackages.nvidia
pkgs.mongodb-compass
pkgs.postman
 pkgs.geeqie
pkgs.viewnior
    pkgs.vlc
  webkitgtk
pkgs.cairo
rustup
pkgs.atk
pkgs.pkg-config
pkgs.discord
python3
  openssl
  librsvg
tmux
kitty
    ranger
spotifyd
yazi
  appimagekit
    pkgs.ungoogled-chromium
pkgs.davinci-resolve
    eog
  ];

nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # ZSH configuration
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "zsh-history-substring-search" ];
    };    
  };

  # Enable Thunar file manager
  programs.thunar.enable = true;
  programs.dconf.enable = true;

virtualisation.docker.enable = true;
  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.05"; # Did you read the comment?
}
