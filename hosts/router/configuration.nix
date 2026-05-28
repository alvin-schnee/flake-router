{ config, pkgs, ... }:

{
  system.stateVersion = "25.11";

  networking.hostName = "RT-90";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users._0x4rch3typ3 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    git
    nano
    nvim
    curl
  ];
}
