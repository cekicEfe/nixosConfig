{ pkgs, ... }: {
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0" 
    ];
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    (heroic.override { extraPkgs = pkgs': with pkgs'; [ gamescope gamemode ]; })

    vim
    alacritty
    kitty

    ollama
    
    guix
    guile
    feh
    codeberg-cli
    libreoffice
    tmux
    ast-grep

    pipewire
    pulseaudio

    btar
    unrar
    unzip
    zip
    ghostscript

    unixtools.xxd

    firefox
    librewolf
    (pkgs.callPackage ./customPackages/torctl/package.nix { })
    tor-browser
    tor
    authenticator
    
    chromium
    chromedriver
    vscode

    ffmpeg-full
    xorg.xkill
    xclip
    home-manager
  ];

  fonts.packages = with pkgs;
    [
      jetbrains-mono
      #(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}

