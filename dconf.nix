{ lib, ... }:

with lib.gvariant;

{
  home-manager.users.heroz = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "green";
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      "org/gnome/desktop/input-sources" = {
        mru-sources = [
          (mkTuple [
            "xkb"
            "us"
          ])
        ];
        sources = [
          (mkTuple [
            "xkb"
            "fr"
          ])
        ];
        xkb-options = [ ];
      };

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
        primary-color = "#241f31";
        secondary-color = "#000000";
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 3;
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        workspaces-only-on-primary = false;
      };

      "org/gnome/shell" = {
        enabled-extensions = [
          "Vitals@CoreCoding.com"
          "forge@jmmaranan.com"
          "clipboard-indicator@tudmotu.com"
          "blur-my-shell@aunetx"
          "appindicatorsupport@rgcjonas.gmail.com"
          "mediacontrols@cliffniff.github.com"
        ];
        disabled-extensions = [ ];
        favorite-apps = [
          "brave-browser.desktop"
          "org.gnome.Console.desktop"
          "org.gnome.Nautilus.desktop"
          "code.desktop"
          "idea.desktop"
          "vesktop.desktop"
        ];
        last-selected-power-profile = "performance";
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-type = "nothing";
      };

      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };

      "org/gnome/desktop/peripherals/keyboard" = {
        numlock-state = true;
      };

      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "default";
        natural-scroll = false;
        speed = -0.28205128205128205;
      };
    };
  };
}
