@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: toolchain
set YOSYS=../bin/yosys/yosys.exe
set PR=../bin/p_r/p_r.exe
set OFL=../bin/openFPGALoader/openFPGALoader.exe

:: project name and sources
set COMMAND=%1
set TOP=%2
set WORKSPACE_DIR=%TOP%
set VLOG_SRC=%WORKSPACE_DIR%/src/blink.v
set VHDL_SRC=%WORKSPACE_DIR%/src/%2.vhd
set LOG=0

:: Place&Route arguments
set PRFLAGS=-ccf %WORKSPACE_DIR%/src/%TOP%.ccf -cCP

2>NUL GOTO :CASE_%COMMAND% @REM jump to :CASE_command if such exists
IF ERRORLEVEL 1 CALL :DEFAULT_CASE @REM If label doesn't exist

:CASE_build
  echo "Running build command..."
  if "%LOG%"=="1" (
        start /WAIT /B %YOSYS% -l %WORKSPACE_DIR%/log/synth.log -p "ghdl --warn-no-binding -C --ieee=synopsys %VHDL_SRC% -e %TOP%; synth_gatemate -top %TOP% -nomx8 -vlog %WORKSPACE_DIR%/net/%TOP%_synth.v"
        start /WAIT /B %PR% -i %WORKSPACE_DIR%/net/%TOP%_synth.v -o %TOP% %PRFLAGS% >&1
    ) else (
        start /WAIT /B %YOSYS% -ql %WORKSPACE_DIR%/log/synth.log -p "ghdl --warn-no-binding -C --ieee=synopsys %VHDL_SRC% -e %TOP%; synth_gatemate -top %TOP% -nomx8 -vlog %WORKSPACE_DIR%/net/%TOP%_synth.v"
        start /WAIT /B %PR% -i %WORKSPACE_DIR%/net/%TOP%_synth.v -o %WORKSPACE_DIR%/%TOP% %PRFLAGS% > %WORKSPACE_DIR%/log/impl.log
    )
    GOTO END_CASE

:CASE_upload
  echo "Running upload command..."
  start /WAIT /B %OFL% -c dirtyJtag %WORKSPACE_DIR%/%TOP%_00.cfg.bit
  GOTO END_CASE

:DEFAULT_CASE
  echo "%COMMAND%" is invalid Possible commands are build, upload.
  GOTO END_CASE

:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL