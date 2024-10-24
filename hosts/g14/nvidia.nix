{ config, pkgs, ... }:

let
  # Fetch nixpkgs-unstable to use for specific packages
  unstablePkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {
    config = { allowUnfree = true; };
    system = builtins.currentSystem;
  };
in
{
  # Use cudatoolkit and other packages from unstable
  environment.systemPackages = with pkgs; [
   cudatoolkit
   # unstablePkgs.nvidia_x11
  ];

  # Enable OpenGL and latest kernel from your stable nixpkgs
  hardware.opengl.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Video drivers from unstable nixpkgs
  services.xserver.videoDrivers = [ "nvidia amdgpu" ];

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

 # nixpkgs.config.packageOverrides = pkgs: {
   # inherit (unstablePkgs) linuxPackages_latest nvidia_x11;
 # };

  hardware.nvidia = {
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;
   # package = unstablePkgs.nvidia_x11;
  };
}
