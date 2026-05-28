{ config, pkgs, ... }:

{
  home.username = "_0x4rch3typ3";
  home.homeDirectory = "/home/_0x4rch3typ3";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland.enable = true;

  home.packages = with pkgs; [
    firefox
    btop
    fastfetch
  ];
}
