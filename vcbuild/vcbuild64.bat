@ECHO off

if not exist dist64 mkdir dist64
if exist dist64\* del /q dist64\*

cd ..\libndtypes
copy /y Makefile.vc Makefile

nmake /nologo clean
nmake /nologo

copy /y libndtypes-0.1.0.lib ..\vcbuild\dist64
copy /y libndtypes-0.1.0.dll ..\vcbuild\dist64
copy /y libndtypes-0.1.0.dll.lib ..\vcbuild\dist64
copy /y libndtypes-0.1.0.dll.exp ..\vcbuild\dist64
copy /y ndtypes.h ..\vcbuild\dist64

cd tests
copy /y Makefile.vc Makefile
nmake /nologo clean
nmake /nologo

copy /y runtest.exe ..\..\vcbuild\dist64
copy /y runtest_shared.exe ..\..\vcbuild\dist64

cd ..\..\vcbuild


