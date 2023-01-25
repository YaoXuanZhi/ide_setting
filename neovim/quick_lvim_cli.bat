@echo off
call "%~dp0quick_lvim_env.bat" 1

if [%1] == [] (
    nvim -u %appdata%/lunarvim/lvim/init.lua --cmd "set runtimepath+=%appdata%/lunarvim/lvim"
) else (
    nvim %1 -u %appdata%/lunarvim/lvim/init.lua --cmd "set runtimepath+=%appdata%/lunarvim/lvim"
)
