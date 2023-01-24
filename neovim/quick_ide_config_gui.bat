@echo off
call "%~dp0quick_ide_config_env.bat" 1

neovide %1 -- -u %localappdata%/nvim/init.lua --cmd "set runtimepath+=%localappdata%/nvim-data"
