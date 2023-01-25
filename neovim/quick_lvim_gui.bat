@echo off
call "%~dp0quick_lvim_env.bat" 1

neovide %1 -- -u %appdata%/lunarvim/lvim/init.lua --cmd "set runtimepath+=%appdata%/lunarvim/lvim"