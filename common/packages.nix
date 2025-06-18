{ pkgs, ... }: {
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0" # "googleearth-pro"
    ];
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
    kitty
    feh
    btar
    unrar
    pipewire
    pulseaudio
    libreoffice-qt6-still
    xfce.xfce4-pulseaudio-plugin
    unzip
    zip
    unixtools.xxd
    devenv

    #home manager
    home-manager

    #xorg things
    xorg.xkill
    xwayland
    xclip
  ];
  fonts.packages = with pkgs;
    [
      jetbrains-mono
      #(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}

