{ pkgs, ... }: {
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0" # "googleearth-pro"
    ];
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    neofetch
    helix
    neovim
    alacritty
    kitty
    feh
    btar
    unrar
    pipewire
    pulseaudio
    unzip
    zip
    unixtools.xxd
    #    ida-free

    home-manager

    xorg.xkill
    xclip
  ];
  fonts.packages = with pkgs;
    [
      jetbrains-mono
      #(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}

