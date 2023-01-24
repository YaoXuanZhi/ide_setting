:::::::::::::::: NeoVim Register Version 1.0 BY 耀轩之 ::::::::::::::::
@echo off
::判断是否已经获取了管理员身份
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo 请使用右键管理员身份运行&&Pause >NUL&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

::设置右键菜单项的名称
set desc="用NeoVim打开"
::设置搭建编译环境的BAT
@REM set runbat="quick_ide_config_gui.bat"
@REM set runbat="quick_ide_config_cli.bat"
set runbat="quick_lvim_cli.bat"
@REM set runbat="quick_lvim_gui.bat"
@REM set runbat="quick_lazy_vim_cli.bat"
@REM set runbat="quick_lazy_vim_gui.bat"
::设置子路径名称
set subname="NeoVimExe"
::去掉双引号，主要是为了兼容包含了空格的文件名或路径
set "runbat=%runbat:"=%"
set "subname=%subname:"=%"
::获取nvim.exe的所在路径
set vimexec=%~dp0nvim-win64\bin\nvim-qt.exe

::添加注册表信息
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%"
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%\command" /v ""  /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"

reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%
reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%\command" /v "" /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"

reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%"
reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%\command" /v "" /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"
