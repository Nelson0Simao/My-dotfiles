-- Date: 2025/02/02
-- Author: Nelson Simão
-- Email: gmail.com
-- License: MIT
-- Version: 1.0
-- Description: Instalar dependecias da aplicação
-- =============================================================

local function command_exists(command)
	local handle = io.popen("command -v " .. command .. " 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result ~= ""
	else
		print("[ERROR] comando não existe")
	end
end

local OS = "debian"

if command_exists("pacman") then
	OS = "arch"
elseif command_exists("apt") then
	OS = "debian"
else
	print("[ERROR] Sistema não suportado")
	os.exit(1)
end

local function exec(command)
	local handle = io.popen(command)
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result
	else
		print("[ERROR] Falha ao executar o comando: " .. command)
	end
end

local OS = nil

if exec("command -v pacman") ~= "" then
	OS = "arch"
elseif exec("command -v apt") ~= "" then
	OS = "debian"
else
	print("System not Suported!")
	os.exit(1)
end

local packages = { "kitty", "neovim", "vim", "tmux", "zsh" }

function install_package()
	local command
	if OS == "arch" then
		command = "sudo pacman -S --noconfirm "
	elseif OS == "debian" then
		command = "sudo apt update && sudo apt install -y " .. table.concat(packages, " ")
	end
	print("Instalando dependencias: " .. command)
	os.execute(command)
end

-- Executa a instalação
install_package()
