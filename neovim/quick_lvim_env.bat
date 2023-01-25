@echo off
set user=user-lvim
call "%~dp0set_nvim_env.bat"

if exist %LOCALAPPDATA% (
    if [%1]==[] (call start cmd /k) 
) else (
    git clone --depth 1 https://github.com/wbthomason/packer.nvim %LOCALAPPDATA%\nvim-data\site\pack\packer\start\packer.nvim
    git clone https://github.com/lunarvim/lunarvim %APPDATA%\lunarvim\lvim
    cd /d %appdata%\lunarvim\lvim
    git reset --hard 9bc82e4e684aa548eb0765734ec4e83f16c78b4c

    if not exist %LOCALAPPDATA%\nvim (mkdir %LOCALAPPDATA%\nvim)
    cp %APPDATA%\lunarvim\lvim\utils\installer\config.example.lua %LOCALAPPDATA%\nvim\config.lua

    nvim -u %appdata%/lunarvim/lvim/init.lua --cmd "set runtimepath+=%appdata%/lunarvim/lvim" -c :LvimSyncCorePlugins
    pause
)