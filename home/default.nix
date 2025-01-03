{ config, pkgs, ... }:

{
  # Set the username and home directory
  home.username = "dream";  # Replace with your actual username
  home.homeDirectory = "/home/dream";  # Replace with your actual home directory

  home.stateVersion = "24.05";

  # Define the packages to be installed in the user's environment
  home.packages = with pkgs; [

    # env & cli
    hyprpaper
    waybar
    oh-my-fish
    glow
    kitty

    # general
    firefox

    # util
    neofetch
    hyprshot
    git-lfs
    qemu

    # code commons
    vscode
    tree
    neovim


    simple-mtpfs
    libmtp

    python311
    nodejs

    # hardware engineering tools
    verilog
    yosys
    gtkwave

    # appdev

    # misc
    ani-cli

    #rust
    rustc
    rustup
    #dioxus-cli
  ];

  # Enable and configure shell programs
  programs.fish.enable = true;  # Enable Z shell
#   programs.zsh.ohMyZsh.enable = true;  # Optional: Enable Oh My Zsh for better shell experience

  programs.git = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
    };
  

home.file = {

  # hyprland and hyprpaper
  ".config/hypr" = {
    source = ./dotfiles/hypr;
    recursive = true;
  };
  ".config/waybar" = {
    source = ./dotfiles/waybar;
    recursive = true;
  };

  ".config/nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };

    ".config/kitty" = {
    source = ./dotfiles/kitty;
    recursive = true;
  };

    ".config/fish" = {
    source = ./dotfiles/fish;
    recursive = true;
  };
};
}
