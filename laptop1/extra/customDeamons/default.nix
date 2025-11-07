{
  systemd.user = let
    #    atuinSockDir = "${config.home.homeDirectory}/.local/share/atuin";
    #    atuinSock = "${atuinSockDir}/atuin.sock";
    #    unitConfig = {
    #      Description = "Atuin Magical Shell History Daemon";
    #      ConditionPathIsDirectory = atuinSockDir;
    #      ConditionPathExists =
    #        "${config.home.homeDirectory}/.config/atuin/config.toml";
    #    };
  in {
    #    sockets.atuin-daemon = {
    #      Unit = unitConfig;
    #      Install.WantedBy = [ "default.target" ];
    #      Socket = {
    #        ListenStream = atuinSock;
    #        Accept = false;
    #        SocketMode = "0600";
    #      };
    #    };
    #    services.atuin-daemon = {
    #      Unit = unitConfig;
    #      Service.ExecStart = "${pkgs.atuin}/bin/atuin daemon";
    #    };
  };
}
