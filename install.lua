-- Date: 2025/02/02
-- Author: Nelson Simão
-- Email: gmail.com
-- License: MIT
-- Version: 1.0
-- Description: Instalar dependecias da aplicação
-- =============================================================

local function exec(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

local OS = nil

if exec("command -v pacman") ~= "" then
    OS = "arch"
elseif exec("command -v apt") ~= "" then
    OS = "debian"
else
    print("Sistema não suportado")
    os.exit(1)
end

local pakages = {
    arch = {"kitty", "neovim", "vim", "tmux", "zsh"},
    debian = {"kitty", "neovim", "vim", "tmux", "zsh"}
}

function install_pakages(system)
    local gem = system == "arch" and "sudo pacman -S " or "sudo apt install -y "
    local command = gem .. table.concat(pakages[system], " ")
    print("installing pakages:" .. command);
    os.execute(command)

end

-- Executa a instalação
install_pakages(OS)

