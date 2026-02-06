{
  config,
  libs,
  pkgs,
  ...
}:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";

in
{
  imports = [
    (import "${home-manager}/nixos")
    ./dconf.nix
  ];

  home-manager.users.heroz =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        brave
        nixfmt-rfc-style
        nil
        amberol
        jetbrains.idea
        prismlauncher
        jdk21_headless
        affine
      ];

      # Fix duplicate brave entry in gnome apps
      xdg.desktopEntries = {
        "com.brave.Browser" = {
          name = "Brave";
          noDisplay = true;
        };
        "org.prismlauncher.PrismLauncher" = {
          name = "Prism Launcher";
          exec = "prismlauncher -d /run/media/heroz/Stockage/Jeux/PrismLauncher-8.4 %U";
          comment="Discover, manage, and play Minecraft instances";
          type="Application";
          terminal=false;
          startupNotify=true;
          icon="org.prismlauncher.PrismLauncher";
        };
      };

      programs.vscode = {
        enable = true;
      };

      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
      };

      programs.vesktop = {
        enable = true;
      };

      programs.git = {
        enable = true;
        settings.user = {
          name = "HerozDotExe";
          email = "herozdotexe@gmail.com";
        };
      };

      nixpkgs.config.allowUnfree = true;
      home.stateVersion = "25.05";
    };
}
