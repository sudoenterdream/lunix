if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.npm-packages/bin $PATH
set -gx NODE_PATH $HOME/.npm-packages/lib/node_modules

