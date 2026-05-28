{ config, pkgs, ... }:

{
  # activation optionnelle simple
  options = {};

  config = {
    programs.hyprland.enable = true;

    security.rtkit.enable = true;

    services.dbus.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];

    environment.systemPackages = with pkgs; [
      wayland
      wl-clipboard
      kitty
      wofi
      mako
      grim
      slurp
    ];
  };
}
