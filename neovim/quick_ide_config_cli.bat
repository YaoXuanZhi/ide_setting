@echo off
call "%~dp0quick_ide_config_env.bat" 1

nvim %1 -u %localappdata%/nvim/init.lua --cmd "set runtimepath+=%localappdata%/nvim-data"
