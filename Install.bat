@echo OFF

ping www.transil.in -n 1 -w 5000 > nul
if errorlevel 1 (
		 echo No  Internet Connection 
		 cmd /k)

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if EXIST "C:\Program Files\nodejs" (echo Node exists!!) else (
	echo Installing Node...
	if %OS%==32BIT cd C:\Users\Public & powershell -command "Invoke-WebRequest https://nodejs.org/dist/v10.13.0/node-v10.13.0-x32.msi -OutFile npm.msi"
	if %OS%==64BIT cd C:\Users\Public & powershell -command "Invoke-WebRequest https://nodejs.org/dist/v10.13.0/node-v10.13.0-x64.msi -OutFile npm.msi"
	powershell -command "./npm.msi")
cmd /k
