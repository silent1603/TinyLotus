@echo off
setlocal

pushd %~dp0
pushd ..\..\
pushd Builds\Windows
if exist "vs2019" (
    :: Change to the directory and run CMake
	cd vs2019
	cpack -G NSIS
	popd 
) else (
    echo vs2019 directory isn't exist
)
popd
popd 
endlocal