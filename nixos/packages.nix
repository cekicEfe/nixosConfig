{ pkgs, ... }: {
  nixpkgs.config = {
    permittedInsecurePackages = [ "python-2.7.18.8" "electron-25.9.0" ];
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    #useless programs
    neofetch
    helix
    neovim
    libsForQt5.okular
    wget
    alacritty
    ranger
    feh
    btar
    unrar
    nitrogen
    pipewire
    pulseaudio
    libreoffice-qt6-still
    wine
    xfce.xfce4-pulseaudio-plugin

    #dev packages
    gnumake
    arch-install-scripts
    pkgsCross.mingw32.buildPackages.gcc
    pkgsCross.mingwW64.buildPackages.gcc
    pkgs.haskell-language-server
    ghc
    libGL.dev
    unzip
    zip
    nodejs
    python
    gcc
    cmake
    git

    #home manager
    home-manager

    #xorg things
    xorg.xkill
    xwayland
    xclip
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

