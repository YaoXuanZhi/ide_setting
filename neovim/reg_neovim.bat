:::::::::::::::: NeoVim Register Version 1.0 BY ҫ��֮ ::::::::::::::::
@echo off
::�ж��Ƿ��Ѿ���ȡ�˹���Ա���
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա�������&&Pause >NUL&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

::�����Ҽ��˵��������
set desc="��NeoVim��"
::���ô���뻷����BAT
@REM set runbat="quick_ide_config_gui.bat"
@REM set runbat="quick_ide_config_cli.bat"
set runbat="quick_lvim_cli.bat"
@REM set runbat="quick_lvim_gui.bat"
@REM set runbat="quick_lazy_vim_cli.bat"
@REM set runbat="quick_lazy_vim_gui.bat"
::������·������
set subname="NeoVimExe"
::ȥ��˫���ţ���Ҫ��Ϊ�˼��ݰ����˿ո���ļ�����·��
set "runbat=%runbat:"=%"
set "subname=%subname:"=%"
::��ȡnvim.exe������·��
set vimexec=%~dp0nvim-win64\bin\nvim-qt.exe

::���ע�����Ϣ
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%"
reg add "HKEY_CLASSES_ROOT\Directory\background\shell\%subname%\command" /v ""  /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"

reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%
reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\%subname%\command" /v "" /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"

reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%" /v "" /t REG_SZ /d %desc%
reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%" /v "Icon" /t REG_EXPAND_SZ /d "%vimexec%"
reg add "HKEY_CLASSES_ROOT\Directory\shell\%subname%\command" /v "" /t REG_EXPAND_SZ /d "\"%~dp0%runbat%\" \"%%V\"
