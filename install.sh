#!/usr/bin/env bash

NEOVIM_VERSION=v0.11.1
TREE_SITTER_VERSION=v0.25.3
LUA_VERSION=5.1
LUAROCKS_VERSION=3.11.1

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

    if [[ "v$(tree-sitter --version | head -n 1 | awk '{print $2}')" = "${TREE_SITTER_VERSION}" ]]; then
        echo "tree-sitter ${TREE_SITTER_VERSION} already installed!"
    else
        echo 'Setting up tree-sitter...'
        curl -sLo /tmp/tree-sitter-linux-x64.gz https://github.com/tree-sitter/tree-sitter/releases/download/${TREE_SITTER_VERSION}/tree-sitter-linux-x64.gz
        cd /tmp
        gzip -d tree-sitter-linux-x64
        cd
        mv /tmp/tree-sitter-linux-x64 ${HOME}/.local/bin/tree-sitter && chmod +x ${HOME}/.local/bin/tree-sitter
    fi

    if [[ "$(lua -v 2>&1 | head -n 1 | awk '{print $2}')" = "${LUA_VERSION}" ]]; then
        echo "lua ${LUA_VERSION} already installed!"
    else
        echo 'Setting up lua...'
        sudo apt-get install libreadline-dev
        curl -sLo /tmp/lua-${LUA_VERSION}.tar.gz https://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz
        tar zxpf /tmp/lua-${LUA_VERSION}.tar.gz -C /tmp
        cd /tmp/lua-${LUA_VERSION}
        make all linux && sudo make install
    fi

    if [[ "$(luarocks --version | head -n 1 | awk '{print $2}')" = "${LUAROCKS_VERSION}" ]]; then
        echo "luarocks ${LUAROCKS_VERSION} already installed!"
    else
        echo 'Setting up luarocks...'
        curl -sLo /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
        tar zxpf /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz -C /tmp
        cd /tmp/luarocks-${LUAROCKS_VERSION}
        ./configure --with-lua-include=/usr/local/include && make && sudo make install
        cd
    fi

    echo 'Updating plugins'
    nvim --headless "+Lazy! restore" +qa
    echo 'Updating language servers'
    nvim --headless "+MasonUpdate" +qa
    echo "Updating Treesitter parsers..."
    nvim --headless "+TSUpdateSync" +qa

}

setup_stow() {
    if ! dpkg -s stow > /dev/null 2>&1; then
        sudo apt-get install stow
    fi
}

main() {
    sudo apt update || exit 1
    setup_stow
    setup_neovim
}

main

trap "exit 1" SIGINT
