@echo off
mode con: cols=110  lines=40
color 3F
Title Limpeza de Maquina
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO 	+												+
echo 	+		                 MANUTENCAO E RECUPERACAO DO WINDOWS				+
echo 	+	     M A N U T E N C A O   E   R E C U P E R A C A O   D O   W I N D O W S		+
ECHO 	+												+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ECHO.
Echo 					Aguarde ou Pressione qualquer tecla
TIMEOUT /T 3
CLS

timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo                          MANUTENCAO E RECUPERACAO DO WINDOWS
    echo.
    echo.
) else (
color 47
echo.
echo 	   A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo 	   A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo 	   ########################################################################################
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                V O C E   N A O   E   A D M I N I S T R A D O R                       #
echo 	   #                                                                                      #
echo 	   #                        Voce deve executar como Administrador                         #
echo 	   #                         Clique com o botao direito do mouse                          #
echo 	   #                      Selecione  ^'Executar como administrador'^                        #
echo 	   #                                 e tente novamente.                                   #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   #                                                                                      #
echo 	   ########################################################################################
echo 	   A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo 	   A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo.
TIMEOUT /T 5
	exit
)

color 6f

echo.
GOTO MenuPri

















:: #######################################################################################################
:MenuPri
cls
color 6f
echo.
ECHO 	    ##### MENU ##### MENU ###### MENU ###### MENU ####### MENU ####### MENU ####### MENU ####
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO 	+												+
echo 	+		                 MANUTENCAO E RECUPERACAO DO WINDOWS				+
echo 	+	     M A N U T E N C A O   E   R E C U P E R A C A O   D O   W I N D O W S		+
ECHO 	+												+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo 				[----------------MENU DE OPCOES-----------------]
ECHO 				[	1.Limpar Lixeira			]
ECHO 				[	2.Limpar Arquivos Temporarios		]
ECHO 				[	3.Limpar Arquivos de Internet		]
ECHO 				[	4.Limpar Arquivos de Backup		]
echo 				[...............................................]
ECHO 				[	5.Reconfigurar Rede			]
ECHO 				[	6.Atualizar Politicas de Grupo		]
ECHO 				[	7.Informacoes da Rede			]
ECHO 				[	8.Habilitar/Desabilitar Rede		]
echo 				[...............................................]
ECHO 				[	9.LogOff de Usuarios			]
echo 				[...............................................]
ECHO 				[	10.Desinstalar JAVA			]
ECHO 				[	11.Liberar Impressao			]
echo 				[...............................................]
ECHO 				[	12.Info do PC				]
ECHO 				[	13.WINDOWS - PAINEL CONTROLE		]
echo 				[...............................................]
ECHO 				[	0.Sair					]
ECHO 				[						]
echo 				[###############################################]
ECHO.

echo.
set /p userinp=Entra com uma Opcao do Menu: 

set /a varCheck=%userinp%

if %varCheck% == %userinp% (

if %userinp% equ 0 GOTO SairPrograma
if %userinp% equ 1 GOTO ClearLixo
if %userinp% equ 2 GOTO ClearTemp
if %userinp% equ 3 GOTO ClearInt
if %userinp% equ 4 GOTO ClearBkp
if %userinp% equ 5 GOTO ConfigLan
if %userinp% equ 6 GOTO FuncgpupRede
if %userinp% equ 7 GOTO infoRedeLan
if %userinp% equ 8 GOTO DISCONADAPTERLANETher
if %userinp% equ 9 GOTO LogOffUser
if %userinp% equ 10 GOTO UninstalJava
if %userinp% equ 11 GOTO SpoolImp
if %userinp% equ 12 GOTO infosysbraz
if %userinp% equ 13 GOTO MenuWinProgram
if %userinp% geq 14 GOTO MenuPri

) else (
ping -n 1 localhost >nul
echo.
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
)
:: #######################################################################################################














:: #######################################################################################################
:ClearTemp
cls
COLOR A0
ECHO.

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo ******************** PASTA TEMP DOS USUÁRIOS ********************

echo Apaga todos arquivos da pasta Temp de todos os usuários, mantendo das pastas
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

echo cria arquivo vazio.txt dentro da pasta Temp de todos usuários
for /d %%F in (C:\Users\*) do type nul >"%%F\Appdata\Local\Temp\vazio.txt"

echo apaga todas as pastas vazias dentro da pasta Temp de todos usuários (mas não apaga a própria pasta Temp)
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Temp\ %%F\AppData\Local\Temp\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np

echo Apaga arquivo vazio.txt dentro da pasta Temp de todos usuários
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\vazio.txt

echo ******************** WINDOWS TEMP ********************

echo Apaga todos arquivos da pasta \Windows\Temp, mantendo das pastas
del c:\Windows\Temp\* /s /q

echo cria arquivo vazio.txt dentro da pasta \Windows\Temp
type nul > c:\Windows\Temp\vazio.txt

echo apaga todas as pastas vazias dentro da pasta \Windows\Temp (mas não apaga a própria pasta)
robocopy c:\Windows\Temp c:\Windows\Temp /s /move /NFL /NDL /NJH /NJS /nc /ns /np

echo Apaga arquivo vazio.txt dentro da pasta \Windows\Temp
del c:\Windows\Temp\vazio.txt

echo ******************** ARQUIVOS DE LOG DO WINDOWS ********************

del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\setup\logs\*.log /s /q

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios do usuario atual...

del /F /Q "%TEMP%\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios do sistema...
del /F /Q "%SystemRoot%\Temp\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios da Internet...
del /F /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios de logs do Windows...
del /F /Q "%SystemRoot%\Logs\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios do Windows Update...
del /F /Q "%SystemRoot%\SoftwareDistribution\Download\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios do Windows Error Reporting...
del /F /Q "%SystemRoot%\WinSxS\ManifestCache\*.*"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Deletando arquivos de Distribuicao

rd /s /q "%windir%\softwaredistribution"
net start wuauserv

echo Arquivos de Distribuicao Concluido
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo A limpeza de arquivos temporarios
del /s /f /q "%WinDir%\Temp\*.*"
del /s /f /q "%Temp%\*.*"
del /s /f /q "%USERPROFILE%\Local Settings\Temp\*.*"
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*"
del /s /f /q "%USERPROFILE%\Local Settings\Temp\*.*"
del /s /f /q "%USERPROFILE%\Recent\*.*"
del /s /f /q "%USERPROFILE%\Cookies\*.*"
del /s /f /q "%HomePath%\AppData\Local\Temp"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul

rd /s /q "%USERPROFILE%\Local Settings\Temp"
rd /s /q "%APPDATA%\Microsoft\Windows\Recent"
rd /s /q "%USERPROFILE%\Local Settings\Temp"
rd /s /q "%USERPROFILE%\Recent"
rd /s /q "%USERPROFILE%\Cookies"
rd /s /q "%HomePath%\AppData\Local\Temp"

echo A limpeza de arquivos temporarios foi concluida.
echo ----------------------------------
ping -n 1 localhost >nul

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Arquivos Prefetch

del /s /f /q "%WinDir%\Prefetch\*.*"

ping -n 1 localhost >nul

rd /s /q "%WinDir%\Prefetch"

echo Arquivos Prefetch Concluido

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo ******************** ADOBE MEDIA CACHE FILES ********************

for /d %%F in (C:\Users\*) do del %%F\AppData\Roaming\Adobe\Common\"Media Cache files"\*.* /s /q

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################
















:: #######################################################################################################
:ClearInt
cls
COLOR A0
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios da Internet...

echo ******************** ARQUIVOS DE LOG DO WINDOWS E IE ********************

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\*.db /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\IE\* /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.dat /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.js /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.htm /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.txt /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.jpg /s /q
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Windows\INetCache\IE\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np

echo ******************** EDGE ********************
taskkill /F /IM "msedge.exe"

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\data*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\f*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\index. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\d*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\i*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Code Cache"\js\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.ldb /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\index. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.log /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\BrowserMetrics\*.pma /s /q


echo ******************** FIREFOX ********************
taskkill /F /IM "firefox.exe"

for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\script*.bin /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\startup*.* /s /q

echo ******************** CHROME ********************
taskkill /F /IM "chrome.exe"

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\data*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\f*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\index. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Storage\*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\d*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\i*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\js\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\brow*.* /s /q


echo ******************** BRAVE ********************
taskkill /F /IM "brave.exe"

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\data*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\f*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\index. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\d*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\i*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Code Cache"\js\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\brow*.* /s /q


echo ******************** VIVALDI ********************
taskkill /F /IM "vivaldi.exe"

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\data*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\f*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\index. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Storage\*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\d*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\i*. /s /q

for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Code Cache"\js\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\Database\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\brow*.* /s /q

echo Limpando os arquivos temporarios do Internet Explorer...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

echo Limpando os arquivos temporários do Microsoft Edge...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 10116

del /q /s /f "%USERPROFILE%\AppData\Local\Microsoft\Internet Explorer\*.*"
del /q /s /f "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\*.*"

echo A limpeza dos arquivos temporarios da Internet foi concluida.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul

echo Limpando os arquivos temporarios do Google Chrome...

:: Fechar o Google Chrome se estiver aberto
taskkill /F /IM chrome.exe

:: Limpar a pasta de arquivos temporarios do Google Chrome
echo Limpando os arquivos temporarios do Google Chrome...

del /q /s /f "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\*.*"
del /q /s /f "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\*.*"
del /q /s /f "%LocalAppData%\Google\Chrome\User Data\Default\Cache"

rd /s /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\*.*"
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"

echo A limpeza dos arquivos temporarios do Google Chrome foi concluida.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################


















:: #######################################################################################################
:ClearBkp
cls
color 6f
ECHO.
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO.
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
echo ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
ECHO.
ECHO ##### MENU ##### MENU ###### MENU ###### MENU ####### MENU ####### MENU ####### MENU ####
ECHO ################################ L I M P A R   B A C K U P ##############################
ECHO #				        						#
ECHO #				   	MENU DE OPCOES					#
ECHO #											#
ECHO #				1.INICIAR LIMPEZA					#
ECHO #				2.CANCELAR - SAIR					#
ECHO #											#
ECHO #########################################################################################
ECHO.
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO.
ECHO.
ECHO LIMPAR ARQUIVOS DE BACKUP (BAK)
ECHO 1 - INICIA LIMPEZA
ECHO 2 - CANCELAR - SAIR
Echo.

CHOICE /C 12 /M "Entra com uma Opcao:"

IF ERRORLEVEL 2 GOTO Shutdown
IF ERRORLEVEL 1 GOTO Restart

:Restart
cls
color 6f
ECHO.
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO.
ECHO.
echo Deletando arquivos de Backups (BAK)
del /s /q /f "c:\*.bak"
echo Arquivos de Backups terminado (BAK)
echo ---------------------------------------------------------
ECHO.
ECHO.
GOTO End

:Shutdown
cls
color cf
ECHO.
ECHO.
echo --------------------------------------------------------------------------------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo --------------------------------------------------------------------------------------------
ECHO.
ECHO.
GOTO End

:End
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
ECHO.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################

















:: #######################################################################################################
:SpoolImp
cls
COLOR A0
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando a fila de impressão...
echo Limpeza de Impressao
echo Parando o servico de spooler de impressao...

net stop spooler
ping -n 1 localhost >nul

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Excluindo arquivos da pasta de spool de impressao...
del /F /Q "%systemroot%\System32\spool\PRINTERS\*
del /F /Q "%systemroot%\System32\spool\PRINTERS\*.*

ping -n 1 localhost >nul

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Iniciando o servico de spooler de impressao...
net start spooler

echo A limpeza da fila de impressao foi concluida.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################
















:: #######################################################################################################
:ConfigLan
cls
COLOR A0
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Otimizando a memoria...
echo Limpando o cache do sistema...
echo Purging the DNS Resolver Cache...

ipconfig /flushdns

echo A otimizacao da memoria foi concluida.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo Limpando Arquivos da Lan/Wan

arp -d *
nbtstat -R
nbtstat -RR

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo Limpando e renovando a configuracao de rede...

echo Reiniciando adaptadores de rede...
ipconfig /release
ipconfig /renew
ipconfig /registerdns

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Corrigindo problemas de rede e conexao com a Internet...

echo Redefinindo as configuracoes TCP/IP...
netsh int ip reset all

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Redefinindo as configuracoes do Winsock...
netsh winsock reset

echo Configuracao Internet Concluida
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo Reiniciando o servico de cliente DHCP...
net stop dhcp
net start dhcp

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Reiniciando o servico de resolucao de problemas de conexao de rede...
net stop dot3svc
net start dot3svc

echo A limpeza e renovacao da configuracao de rede foram concluidas.
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
ping -n 1 localhost >nul
ECHO.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################

















:: #######################################################################################################
:FuncgpupRede
cls
color 6f
ECHO.
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO.
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
echo ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
ECHO.
ECHO ##### MENU ##### MENU ###### MENU ###### MENU ####### MENU ####### MENU ####### MENU ####
ECHO ############################## ATUALIZAR POLITICAS DE GRUPO #############################
ECHO #				        						#
ECHO #				   	MENU DE OPCOES					#
ECHO #											#
ECHO #				1.INICIAR ATUALIZACAO					#
ECHO #				2.CANCELAR - SAIR					#
ECHO #											#
ECHO #########################################################################################
ECHO.
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO.
ECHO.
ECHO ATUALIZAR POLITICAS DE GRUPOS
ECHO 1 - INICIA A ATUALIZACAO
ECHO 2 - CANCELAR - SAIR
Echo.
CHOICE /C 12 /M "Entra com uma Opcao:"

IF ERRORLEVEL 2 GOTO GPUPEXIT
IF ERRORLEVEL 1 GOTO GPUPINI

:GPUPINI
cls
color 02
ECHO.
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR - ESSE PROCESSO PODE DEMORAR
ECHO.
ECHO.
echo Atualizando Politicas de Grupo
gpupdate /force
gpupdate /sync
echo.
echo Politica de Grupo Concluido
echo ---------------------------------------------------------
ECHO.
ECHO.
GOTO GPUPEnd

:GPUPEXIT
cls
color cf
ECHO.
ECHO.
echo --------------------------------------------------------------------------------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo ------------- C A N C E L A D O  C A N C E L A D O  C A N C E L A D O  ---------------------
echo --------------------------------------------------------------------------------------------
ECHO.
ECHO.
GOTO GPUPEnd

:GPUPEnd
ping -n 1 localhost >nul
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################

















:: #######################################################################################################
:LogOffUser
cls
COLOR A0

set vlcUserNomeTempT2=%username:~0,-3%
goto fID_UserDigIniMenu









:fID_UserDigIniMenu
cls
echo.
echo.
echo.
echo ......................... Usuarios Logados .......................
echo ------------------------------------------------------------------

qwinsta

echo ==================================================================
echo.
echo.
echo 	Digite o Id para Deslogar:

set vlnID_UserDig=
set /p vlnID_UserDig=Digite o ID: 

set vlcUserNome=
FOR /f "tokens=1" %%k IN ('qwinsta ^| find "%vlnID_UserDig%"') DO (set vlcUserNome=%%k)

if "%vlcUserNome%" == ">console" (
	FOR /f "tokens=2" %%k IN ('qwinsta ^| find "%vlnID_UserDig%"') DO (set vlcUserNome=%%k)
)

IF "%vlcUserNome%" == "%vlcUserNomeTempT2%" (
	set vlcUserNome=%username%
)


set /a varCheck_IDUser=%vlnID_UserDig%
goto fID_UserDigValLogOFf













:fID_UserDigValLogOFf
if %varCheck_IDUser% == %vlnID_UserDig% (
	
	if "" == "%vlcUserNome%" (
		echo ID Usuario nao Encontrado. Logon Invalido - "%vlnID_UserDig%" - "%vlcUserNome%"
		echo.
		pause > nul
		goto fID_UserDigIniMenu
	) else (
		cls
		echo.
		echo.
		echo ................ Usuario Encontrado .......................
		echo.
		echo 	ID "%varCheck_IDUser%"
		echo 	Usuario "%vlcUserNome%"
		echo.
		echo Deseja Realmente fazer logoff?
		echo.
		echo.

		pause
		
		if "%username%" == "%vlcUserNome%" (
			echo.
			echo --------------------------------------------------------------------
			echo 	Usuario nao pode fazer logoff. 
			echo 	ID "%varCheck_IDUser%" - Usuario "%vlcUserNome%"
			echo.
			echo.
			pause
			goto fID_UserDigIniMenu
		) else (
			echo ------------------------------------------------
			echo 	Aguarde Fazendo LogOFF
			echo 	ID "%varCheck_IDUser%" - Usuario "%vlcUserNome%"
			logoff %varCheck_IDUser%
			echo ................................................
			echo.
			echo LogOff Concluido - ID "%varCheck_IDUser%" - "%vlcUserNome%"
			echo.
			echo.
			pause
			goto fID_UserDigIniMenu
		)
	)
) else (
	echo.
	echo OPCAO INVALIDA. TENTE NOVAMENTE
	echo OPCAO INVALIDA. TENTE NOVAMENTE
	goto fID_UserDigEND
)










:fID_UserDigEND
echo.
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################

















:: #######################################################################################################
:infosysbraz
cls
COLOR A0
SET TEMPFILEDri=%temp%\temptext%random%%random%%random%.txt

SystemInfo > %TEMPFILEDri%

echo #######################################
hostname
Echo ..................Informacoes do Sistema.................
echo.
echo %PROCESSOR_IDENTIFIER%
wmic cpu get name

type %TEMPFILEDri% | find /i "Nome do sistema operacional:"
type %TEMPFILEDri% | find /i "Versão do sistema operacional:"

type %TEMPFILEDri% | find /i "Identificação do produto"

type %TEMPFILEDri% | find /i "Fabricante do sistema:"
type %TEMPFILEDri% | find /i "Modelo do sistema:"
type %TEMPFILEDri% | find /i "Tipo de sistema"
echo.
echo .....................................
type %TEMPFILEDri% | find /i "host:"
type %TEMPFILEDri% | find /i "Domínio:"
type %TEMPFILEDri% | find /i "Servidor de Logon:"
echo Usuario:				   %username%
echo Dominio: 				   %USERDOMAIN%
echo Servidor de Logon: 			   %LOGONSERVER%
ipconfig | find /i "ipv4"
echo.
echo .....................................
echo .....................................
echo .....................................
echo .....................................
echo.
echo.
echo %computername%
echo.
wmic baseboard get product,Manufacturer,version,serialnumbe
echo.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################








:: #######################################################################################################
:infoRedeLan
cls
COLOR 4f
ECHO.
ECHO.
ECHO VERIFICAR MAQUINA REMOTA
ECHO POR FAVOR DIGITE O NUMERO DO IP
echo DIGITA NADA PARA SAIR
ECHO.
echo Digite Numero do Ip?
ECHO.
set /p host=Entrar com o Ip: 

If /I "%host%"!==!"" goto infoRedeLanyes
If /I "%host%"=="" goto infoRedeLanno

:infoRedeLanyes
    ping -n 1 -w 1000 %host% | find /i "TTL=" >NUL && (
        cls
	ECHO.
	ECHO.
	ECHO --------------------------------------------------------
	echo %host% : ONLINE
	nslookup %host%
	ECHO --------------------------------------------------------
	tracert %host%
	ECHO.
	ECHO --------------------------------------------------------
	echo.
	ping -l 1300 -a %host% | Find /i "Resposta"
	echo.
	ECHO --------------------------------------------------------
	nbtstat -a %host%
	ECHO --------------------------------------------------------
	ping -n 1 -a %host% | find /i "Disparando"
    ) || (
        echo %host% : OFFLINE
    )

goto infoRedeLanend

:infoRedeLanno
CLS
ECHO.
ECHO.
echo CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO
echo CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO
echo CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO - CANCELADO
ECHO.
goto infoRedeLanend

:infoRedeLanend
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################











:: #######################################################################################################
:UninstalJava
cls
color 17
echo.
echo.
echo.
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO 	+										+
echo 	+		                 DESINSTALACAO JAVA				+
echo 	+		      D E S I N S T A L A N D O   J A V A			+
ECHO 	+										+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo 	    ESSE PROCESSO LEVA VARIOS MINUTOS
ECHO 	P R O C E S S O   P O D E   D E M O R A R
echo.
echo.
echo 			Pressione Qualquer Tecla
echo 	Iniciar Processo...........................

pause > nul

cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:## 16%%
echo ----------------------------------

wmic product where "name like 'Java 7%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:#### 33%%
echo ----------------------------------

wmic product where "name like 'JavaFX%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:####### 49%%
echo ----------------------------------

wmic product where "name like 'Java(TM) 7%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:############### 66%%
echo ----------------------------------

wmic product where "name like 'Java(tm) 6%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:##################### 81%%
echo ----------------------------------

wmic product where "name like 'J2SE Runtime Environment%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:############################## 97%%
echo ----------------------------------

wmic product where "name like 'Java 8%%'" call uninstall /nointeractive
cls
echo.
echo.
echo Desinstalando Java - Isso pode Demorar...
echo ----------------------------------
echo Progresso:##################################### 100%%
echo ----------------------------------

echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################














:: #######################################################################################################
:MenuWinProgram
cls
color 57
echo.
ECHO 	    ##### MENU ##### MENU ###### MENU ###### MENU ####### MENU ####### MENU ####### MENU ####
ECHO 	    ################################ M E N U   P R I N C I P A L ############################
echo.
echo 				[----------------MENU DE OPCOES-----------------]
ECHO 				[						]
ECHO 				[	1.Adicionar e Remover Programas 	]
ECHO 				[	2.Reorganizar Tela 			]
ECHO 				[	3.Som  					]
ECHO 				[	4.Volume Som 				]
ECHO 				[	5.Conexao Area Remota 			]
ECHO 				[	6.Limpeza de Disco do Windows 		]
ECHO 				[	7.Gerenciador de Dispositivo 		]
ECHO 				[	8.Configuracoes Adaptador de Rede 	]
ECHO 				[	9.Propriedades do Sistema 		]
ECHO 				[	10.Gerenciador de Tarefas		]
ECHO 				[	11.Scanners e Cameras 			]
ECHO 				[	12.Opcao de Pasta 			]
ECHO 				[	13.Sobre PC 				]
ECHO 				[	14.Resumo do Sistema 			]
ECHO 				[	15.Monitor de Recurso 			]
ECHO 				[	16.Projetor 				]
ECHO 				[	17.Seguranca e Manutencao 		]
ECHO 				[	18.Sobre o Windows 			]
ECHO 				[	0.VOLTAR MENU PRINCIPAL			]
ECHO 				[						]
echo 				[###############################################]
ECHO.
echo.
set /p userinp=Entra com uma Opcao do Menu: 

set /a varCheck=%userinp%

if %varCheck% == %userinp% (

if %userinp% equ 1 appwiz.cpl
if %userinp% equ 2 desk.cpl
if %userinp% equ 3 mmsys.cpl
if %userinp% equ 4 sndvol
if %userinp% equ 5 mstsc
if %userinp% equ 6 cleanmgr
if %userinp% equ 7 hdwwiz.cpl
if %userinp% equ 8 ncpa.cpl
if %userinp% equ 9 sysdm.cpl
if %userinp% equ 10 taskmgr
if %userinp% equ 11 control /name Microsoft.ScannersAndCameras
if %userinp% equ 12 control /name Microsoft.FolderOptions
if %userinp% equ 13 control /name Microsoft.System
if %userinp% equ 14 msinfo32
if %userinp% equ 15 resmon
if %userinp% equ 16 displayswitch
if %userinp% equ 17 wscui.cpl
if %userinp% equ 18 winver
if %userinp% equ 0 GOTO MenuPri
if %userinp% geq 19 GOTO :MenuWinProgram

GOTO :MenuWinProgram

) else (
ping -n 1 localhost >nul
echo.
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo.
echo Pressione qualquer tecla para Voltar ao Painel de Controle
pause > nul
GOTO :MenuWinProgram
)
:: #######################################################################################################









:: #######################################################################################################
:ClearLixo
cls
COLOR A0
ECHO.

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO ******************** LIXEIRA ********************
del c:\$recycle.bin\* /s /q
PowerShell.exe -NoProfile -Command Clear-RecycleBin -Confirm:$false >$null
del $null

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando a lixeira...
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Low\Content.IE5"
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Low"

del /f /s /q c:\$Recycle.bin\*.*
del /f /s /q d:\$Recycle.bin\*.*
del /f /s /q e:\$Recycle.bin\*.*

call powershell.exe Clear-RecycleBin -force -ErrorAction:Ignore

echo Lixeira Concluida
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################


















:: #######################################################################################################
:DISCONADAPTERLANETher
cls
COLOR A0
ECHO.
echo  Listando adaptadores de Rede (Internet)
netsh interface show interface
echo ==========================================================================

goto IniNETVarCon

:IniNETVarCon
set /p varCharAdapNetCon=Nome da interface de Rede: 

for /f "tokens=4" %%a in ('netsh interface show interface ^| find "%varCharAdapNetCon%"') do (set variIPNETCON=%%a)

if "%varCharAdapNetCon%"== "" (
	goto endNetCon
) else (
	if "%variIPNETCON%"== "" (
		set varCharAdapNetCon=
		goto IniNETVarCon
	) ELSE (
		echo.
		echo.
		echo 			INICIANDO PROCEDIMENTO "%varCharAdapNetCon%" adapter. AGUARDE...
		goto FullNetCon
))




:Disadlingadapter
color 4f
echo.
netsh interface set interface "%varCharAdapNetCon%" disable
echo "%varCharAdapNetCon%" adapter Disabilitado.
echo ==========================================================================
timeout /t 5 >nul
goto endNetCon





:Enablingadapter
color 0A
echo.
netsh interface set interface "%varCharAdapNetCon%" enable
echo "%varCharAdapNetCon%" adapter Habilitado.
echo ==========================================================================
goto endNetCon





:FullNetCon
echo ------------------------------------------------------------------------
netsh interface show interface "%varCharAdapNetCon%" | find "Desconectado" > nul && (
  echo Adaptador Desabilitado - Estamos Habilitando Dispositivo - "%varCharAdapNetCon%"
  netsh interface set interface "%varCharAdapNetCon%" enabled
  goto endNetCon
) || (
  echo Adaptador Habilitado - Estamos Desabilitando o Dispositivo - "%varCharAdapNetCon%"
  netsh interface set interface "%varCharAdapNetCon%" disabled > nul
	IF ERRORLEVEL 1 (
  		color 4f
		ECHO ATENCAO.
		echo ACONTECEU ALGUM ERRO
	) ELSE (
	timeout /t 5 >nul
	GOTO :Enablingadapter
	)
)

:endNetCon
echo.
echo ------------------------------------------------------------------------
echo.
echo Procedimento Concluido - Finalizando...
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ping -n 1 localhost >nul
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################























:: #######################################################################################################
:SairPrograma
COLOR A0
echo Pressione Sair do Programa..
TIMEOUT /T 3
exit
:: #######################################################################################################
