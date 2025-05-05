#!/usr/bin/env bash

NEOVIM_VERSION=v0.11.1

setup_neovim() {
    if [[ "$(nvim --version | head -n 1 | awk '{print $2}')" = "${NEOVIM_VERSION}" ]]; then
        echo "Neovim ${NEOVIM_VERSION} already installed!"
    else
        echo 'Removing previous neovim version'
        if pdkg -s neovim > /dev/null 2>&1; then
            sudo apt-get remove neovim
        fi
        sudo rm -f $(which nvim)
        echo 'Setting up neovim...'
        curl -sLo /tmp/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux-x86_64.tar.gz
        tar xzf /tmp/nvim-linux-x86_64.tar.gz -C /tmp
        chmod +x /tmp/nvim-linux-x86_64/bin/nvim
        sudo mv /tmp/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    fi
}

setup_stow() {
    if ! dpkg -s stow > /dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install stow
    fi
}

main() {
    setup_stow
    setup_neovim
}

main
