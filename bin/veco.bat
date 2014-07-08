@echo off

setlocal

for /f "delims=/ tokens=1-3" %%a in ("%DATE:~4%") do (
  for /f "delims=:. tokens=1-4" %%m in ("%TIME: =0%") do (
    set VECO_FILE=%TEMP%\veco-%%c-%%b-%%a-%%m%%n%%o%%p
  )
)

vim -c Veco -
if %ERRORLEVEL% neq 0 goto end
type %VECO_FILE%
del %VECO_FILE%

:end
endlocal
exit /b %ERRORLEVEL%
