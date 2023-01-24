@echo off
set mine_root=%~dp0
set USERPROFILE=%mine_root%run_dir\%user%
set APPDATA=%mine_root%run_dir\%user%\AppData\Roaming
set LOCALAPPDATA=%mine_root%run_dir\%user%\AppData\Local
set nvim_runtime=%mine_root%nvim-win64
set gnu_runtime=%mine_root%GnuWin32
set gcc_runtime=%mine_root%gcc-for-windows\w64devkit

set path=%mine_root%;%path%
set path=%nvim_runtime%\bin;%nvim_runtime%;%path%
set path=%gcc_runtime%\bin;%path%
set path=%gnu_runtime%\bin;%path%
set path=%gnu_runtime%\fd-v8.6.0-x86_64-pc-windows-gnu;%path%
set path=%gnu_runtime%\ripgrep-13.0.0-x86_64-pc-windows-gnu;%path%