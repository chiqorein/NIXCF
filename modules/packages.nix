{ config, pkgs, ghostty, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    upower
    alacritty
    dmenu
    swift
    (lua.withPackages(ps: with ps; [ busted luafilesystem ]))
    gnumake
    itch
    # libgda
    nix-search
    krita
    nushell
    sway
    nixfmt-rfc-style
    starship
    ripgrep
    nix-prefetch-git
    warp-terminal
    emacs
    zed-editor
    sassc
    nixpkgs-review
    ags
    ihaskell
    ghc
    xarchiver
    pipewire
    networkmanager
    hyprshade
    hyprpicker
    swww
    imagemagick
    libgtop
    emacsPackages.doom
    nodePackages.prisma
    nodePackages.npm
    p7zip
    sbclPackages.cl-cffi-gtk-gdk-pixbuf
    python312Packages.pip
    fontconfig    # Essential font management package
  cantarell-fonts  # Example of a TTF font package
  dejavu_fonts  # Another example of a TTF font package
    pangolin
    atk
    gdk-pixbuf
    ghostty.packages.x86_64-linux.default
    pkgs.hyprpanel
    # appimage-run
    zlib
    sqlite
    git
    ani-cli
    ubuntu-sans
    mdcat
    xscreensaver
    gnome-keyring
    nixfmt-rfc-style
    haskellPackages.xmonad
    haskellPackages.xmobar
    xmonad-with-packages
    acpi
    pkgs.haskellPackages.xmonad-contrib
    cudatoolkit 
    gtkwave
    haskellPackages.webkit2gtk3-javascriptcore
    vhdl-ls
    gtk3-x11
    haskellPackages.gi-atk
    pkgs.atkmm
    go-sct
      ubuntu-sans
      libsoup
  mononoki
    font-awesome
    scrot
    okular
    gnomeExtensions.color-picker
    tt
    networkmanagerapplet
    markdown-oxide
    marksman
    zls
    lldb
    haskellPackages.jsaddle-webkit2gtk
    nitrogen
    pasystray
    picom
    ghdl-llvm
    maim
    htop
    nvtopPackages.full
    steam
    xclip
    xdotool
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXi
  vulkan-loader
  wayland
    gtk4
    glib   
    pango
    gobject-introspection
graphene
  libxkbcommon
    polkit_gnome
    pulseaudioFull
    mkdocs
    zip
    maven
    libngspice
    vscode
    fira-code
    rofi
    octaveFull
    home-manager
    hyperfine
    vim
    deno
    zellij
    android-studio
    curl
    unrar
    lutris
    git-credential-manager
    helix
    lshw
    networkmanager
    yambar-hyprland-wses
    yambar
    qemu
    bun
    obs-studio
    brave
    unzip
    eww
    waybar
    libsForQt5.kdenlive
    brightnessctl
    neofetch
    vimPlugins.zenbones-nvim
    zsh
    c3c
    opentabletdriver
    oh-my-zsh
    opam
    ocamlPackages.utop
    simulide
    ghdl
    zsh-completions
    starship
    zsh-powerlevel10k
    carapace
    gleam
    vesktop
    zsh-syntax-highlighting
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    libngspice
    gwe
    go
    zsh-history-substring-search
    dunst
    cargo-tauri
    tree
    rustc
    nodejs_22
    pacman
    docker
    cargo
    gccgo14
    pkg-config
    davinci-resolve
    ngspice
    nvtopPackages.nvidia
    mongodb-compass
    postman
    geeqie
    viewnior
    vlc
    webkitgtk
    cairo
    rustup
    atk
    pkg-config
    discord
    python3
    openssl
    librsvg
    tmux
    kitty
    ranger
    spotifyd
    yazi
    # appimagekit
    wezterm
    polybar
    grimblast
    ungoogled-chromium
    jdk
    react-native-debugger
    pfetch
    zip
    davinci-resolve
    eog
  ];

  environment.shells = with pkgs; [ nushell ];
  
}

