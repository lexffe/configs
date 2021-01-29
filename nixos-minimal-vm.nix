# very basic config for bootstrapping a workable nixos environment (VM)

{ config, pkgs, ... };

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lexffe-nixos";

  time.timeZone = "Europe/London";

  ## iface names differ.
  # networking.interfaces.ens160.useDHCP = true;

  services.printing.enable = false;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.asm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  }

  environment.systemPackages = with pkgs; [
    wget vim zsh emacs
    open-vm-tools ## vmware
  ];

  ## !!!
  services.openssh.enable = true;

  ## !!!
  networking.firewall.enable = false;

  system.stateVersion = "20.09";
}
  