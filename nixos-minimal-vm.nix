# very basic config for bootstrapping a workable nixos environment (VM)
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lexffe-nixos";

  time.timeZone = "Europe/London";

  networking.useDHCP = false;
  networking.interfaces.ens160.useDHCP = true;

  # i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = false;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.asm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    wget vim zsh git
    open-vm-tools
  ];

  programs.zsh.enable = true;

  ## !!! Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ## !!!
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  system.stateVersion = "21.03";

  hardware.opengl.enable = true;
  programs.xwayland.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
    desktopManager.default = "gnome3";
    displayManager.gdm.wayland = true;
  };

}
