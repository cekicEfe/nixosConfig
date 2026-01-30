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
    codeberg-cli
    libreoffice

    pipewire
    pulseaudio

    btar
    unrar
    unzip
    zip

    unixtools.xxd

    firefox
    librewolf
    (pkgs.callPackage ./customPackages/torctl/package.nix
      { }) # Fuck all of you who make me use this shit
    tor-browser
    tor

    vscode

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

