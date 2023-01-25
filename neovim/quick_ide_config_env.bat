@echo off
set user=user-ide-config
call "%~dp0set_nvim_env.bat"

if exist %LOCALAPPDATA% (
    if [%1]==[] (call start cmd /k) 
) else (
    git clone --depth 1 https://github.com/LunarVim/nvim-basic-ide %LOCALAPPDATA%\nvim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim %LOCALAPPDATA%\nvim-data\site\pack\packer\start\packer.nvim
    nvim --headless -c :PackerInstall
    nvim --headless -c :MasonInstall
    pause
)