:: //////////////////////////////////////////////////////////////////////////////
::Code by Kami (osintpro on discord)
::09/16/2023
::Coded with my heart <3
:: //////////////////////////////////////////////////////////////////////////////


:: //////////////////////////////////////////////////////////////////////////////
@echo off
setlocal EnableDelayedExpansion
chcp 65001>nul
set wtemp="%temp%\WinKami"
set wcrack="rarreg.key"
setlocal
title ByKami
:: //////////////////////////////////////////////////////////////////////////////

:: //////////////////////////////////////////////////////////////////////////////
:: Check perm
net session >nul 2>&1
if %errorLevel% == 0 (
    goto next
) else (
    goto endfalse
)
:: //////////////////////////////////////////////////////////////////////////////
:next
:: //////////////////////////////////////////////////////////////////////////////
:: Close process
taskkill /f /im WinRar.exe 2>nul
:: //////////////////////////////////////////////////////////////////////////////
:: Chemin WinRar
for /f "delims=" %%I in ('powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null; $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog; $folderBrowser.Description = 'Sélectionnez le dossier WinRar (par defaut dans "C:\Program Files\")'; $folderBrowser.RootFolder = 'MyComputer'; $folderBrowser.SelectedPath = '%~dp0'; $folderBrowser.ShowNewFolderButton = $true; $result = $folderBrowser.ShowDialog(); if ($result -eq 'OK') { Write-Output $folderBrowser.SelectedPath } else { Write-Output 'Aucun dossier sélectionné.' }"') do set "winrar=%%I"
del /f /q "%winrar%\rarreg.key"
:: //////////////////////////////////////////////////////////////////////////////

:: //////////////////////////////////////////////////////////////////////////////
:: Crack
cd %temp%
if not exist %wtemp% mkdir WinKami
cd WinKami
Del /f /q /a temp.dat >nul 2>&1
for %%b in ( 
52415220726567697374726174696F6E20646174610D0A57696E5241520D0A556E6C696D6974656420436F6D70616E79204C6963656E73650D0A5549443D34623931346662373732633833373662663537310D0A363431323231323235306635373131616430373263663335316366613339
6532383531313932646166386133363236383162626231640D0A6364343864613164313464393935663062626639363066636536636235666664653632383930303739383631626535373633383731370D0A3731333163656438333565643635636337343364393737376632656137316138
653332633765353933636636363739343334333536350D0A6234316263663536393239343836623862636461633333643530656366373733393936303532353938663166353536646566666662640D0A39383266626537316539336466366236333436633337613338393066336337656463
36356437663534353534373064313364313139300D0A3665366662383234626366323566313535353437623566633431393031616435386330393932663537306265316366353630386261390D0A616566363964343863383634626364373264313531363338393737373364333134313837
663661396166333530383038373139373936
) Do >>temp.dat (Echo.For b=1 To len^("%%b"^) Step 2
ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs temp.dat>rarreg.key
Del /f /q /a temp.dat >nul 2>&1
powershell -Command "Move-Item -Path '%wcrack%' -Destination '%winrar%' -Force"
cd ..
rmdir /s /q WinKami
goto end
:: //////////////////////////////////////////////////////////////////////////////

:: //////////////////////////////////////////////////////////////////////////////
:end
cls
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('WinRar à bien été cracké.','ByKami')" >nul
start "" "%winrar%\WinRAR.exe"
start "" https://github.com/KamiHateOmg
exit
:: //////////////////////////////////////////////////////////////////////////////

:: //////////////////////////////////////////////////////////////////////////////
:endfalse
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Veuillez ouvrir en tant qu''administrateur.','ByKami')" >nul
exit