{ config, lib, pkgs, ... }:

{

  # Import hardware configuration and Nvidia settings
  imports = [
    ./hosts/g14/hardware-configuration.nix
    ./hosts/g14/nvidia.nix
  ];

  # Nix settings
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";

  # Bootloader configuration
  boot.loader = {
    systemd-boot.enable = true;
      # Limit the number of generations to keep
    systemd-boot.configurationLimit = 5;
    efi.canTouchEfiVariables = true;
  };

  #tmpfs
  boot.tmpOnTmpfs = true;
  boot.tmpOnTmpfsSize = "14G";

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Networking
  networking = {
    hostName = "lunix";
    networkmanager.enable = true;
    firewall = {
	enable = true;
	allowedTCPPorts = [3000];
    };
  };

  # Localization
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users.users.dream = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Environment
  environment.systemPackages = with pkgs; [
    brightnessctl
    iptables
    wl-clipboard
    lxqt.lxqt-policykit

    gcc
    pkg-config
    openssl
    openssl.dev
    cmake    
  ];

  # Fonts
  fonts = {
    packages = with pkgs; [
      fantasque-sans-mono
      font-awesome
      hack-font
    ];
    fontDir.enable = true;
  };

  virtualisation = {
	docker.enable = true;
  };

  # Services
  services = {
    xserver = {
      enable = true;
      };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    supergfxd.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  #Security
  security = {
    polkit.enable = true;
  };

  # Programs
  programs = {
    hyprland.enable = true;
    thunar.enable = true;
  };

}
