if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.npm-packages/bin $PATH
set -gx NODE_PATH $HOME/.npm-packages/lib/node_modules

set -gx ANDROID_HOME $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools


set -x PKG_CONFIG_PATH /nix/store/*-openssl*/lib/pkgconfig $PKG_CONFIG_PATH
set -x OPENSSL_DIR /nix/store/*-openssl*

function cursor
    nohup appimage-run /home/dream/app_images/cursor-0.42.3x86_64.AppImage > /dev/null 2>&1 &
end

