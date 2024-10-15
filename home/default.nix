{ config, pkgs, ... }:

{
  # Set the username and home directory
  home.username = "dream";  # Replace with your actual username
  home.homeDirectory = "/home/dream";  # Replace with your actual home directory

  home.stateVersion = "24.05";

  # Define the packages to be installed in the user's environment
  home.packages = with pkgs; [
    verilog
    yosys
    gtkwave
    android-studio
    flutter
    python3
    glow
    nodejs
    ani-cli
    oh-my-fish
    vscode
    kitty
    firefox
    tree
    hyprpaper
    waybar
    neovim
    neofetch
    hyprshot
  ];

  # Enable and configure shell programs
  programs.fish.enable = true;  # Enable Z shell
#   programs.zsh.ohMyZsh.enable = true;  # Optional: Enable Oh My Zsh for better shell experience

  programs.git = {
    enable = true;
  };

  programs.home-manager.enable = true;

home.file = {
  ".config/hypr/hyprpaper.conf".text = ''
  preload = /home/dream/Downloads/brightday.jpg
  wallpaper = , /home/dream/Downloads/brightday.jpg
  '';
};
}
