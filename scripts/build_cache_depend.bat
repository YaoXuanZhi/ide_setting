@echo off

::�ж��Ƿ��Ѿ���ȡ�˹���Ա���
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա�������&&Pause >NUL&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

set localDirName=UserData

::�л����ýű�������Ŀ¼
cd /d %~dp0

::�������л����Զ���Ļ���Ŀ¼
call :create_local_dir %localDirName%
cd /d %localDirName%

call :create_link .nuget %USERPROFILE%
call :create_link .vscode %USERPROFILE%
call :create_link JetBrains %LOCALAPPDATA%
call :create_link Unity %LOCALAPPDATA%
call :create_link Unity3dRider %TEMP%

pause

::--------------------------- ���� ---------------------------

::desc ����ָ��Ŀ¼�����ɶ�Ӧ��Ŀ¼����
::source_dir [in] Դ�ļ�����
::target_path [in] ���ӵ���Ŀ��·��
:create_link
call :create_local_dir %1
if exist %2 (call :bind_link %1 %2) else (������%2��������ȷ�ϸ�·��)
GOTO :eof

::desc ����Ŀ¼����
::source_dir [in] Դ�ļ�����
::target_path [in] ���ӵ���Ŀ��·��
:bind_link
set tempDir=%2/%1
::ȥ��·���ϵ�˫����
set "tempDir=%tempDir:"=%"

if not exist "%tempDir%" (
    mklink /d "%tempDir%" "%cd%/%1"
) else (
    echo "%tempDir%"�Ѿ����ڣ�����
)
GOTO :eof

::desc �ڵ�ǰĿ¼�´���Ŀ¼
::path [in] ��������Ŀ¼·��
:create_local_dir
if not exist "%cd%/%1" (
    mkdir "%cd%/%1"
    echo �ɹ�������"%cd%/%1"
)
GOTO :eof

::desc ȥ�����������˫����
::var [in] ���滻˫���ŵı���
:removequotes
FOR /F "delims=" %%A IN ('echo %%%1%%') DO set %1=%%~A
GOTO :eof