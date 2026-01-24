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
  ];

  home-manager.users.heroz =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        brave
        nixfmt-rfc-style
        nil
      ];

      # Fix duplicate brave entry in gnome apps
      xdg.desktopEntries."com.brave.Browser" = {
        name = "Brave";
        noDisplay = true;
      };

      programs.vscode = {
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
