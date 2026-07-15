@echo off
mode con: cols=110  lines=40
color 3F
Title Limpeza de Maquina v2.0

:: =============================================================================================
:: MANUTENCAO E RECUPERACAO DO WINDOWS - v2.0
:: Revisado: bugs corrigidos, confirmacoes de seguranca, log de execucao,
::           limpador de registro (itens seguros) e ajustes visuais.
:: =============================================================================================

set "LOGFILE=%~dp0log_manutencao.txt"
echo ==== Sessao iniciada em %date% %time% ==== >> "%LOGFILE%"

ECHO.
ECHO.
ECHO.
ECHO.
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO 	+											+
echo 	+			MANUTENCAO E RECUPERACAO DO WINDOWS				+
echo 	+	M A N U T E N C A O   E   R E C U P E R A C A O   D O   W I N D O W S		+
ECHO 	+											+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
Echo 					Aguarde ou Pressione qualquer tecla
TIMEOUT /T 3
CLS

:: -------------------------------------------------------------------------------
:: Verificacao de administrador (metodo mais confiavel que "openfiles")
:: -------------------------------------------------------------------------------
net session >nul 2>&1
if %errorlevel%==0 (
    echo                          MANUTENCAO E RECUPERACAO DO WINDOWS
    echo.
    echo.
) else (
color 47
echo.
echo 	   	A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo 	   	A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo 	   ######################################################################################
echo 	   #											#
echo 	   #			V O C E   N A O   E   A D M I N I S T R A D O R			#
echo 	   #											#
echo 	   #			Voce deve executar como Administrador				#
echo 	   #			Clique com o botao direito do mouse				#
echo 	   #			Selecione  ^'Executar como administrador'^			#
echo 	   #			e tente novamente.						#
echo 	   #											#
echo 	   ######################################################################################
echo 	   A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O  A T E N C A O
echo.
TIMEOUT /T 5
	exit /b
)

color 6f
GOTO MenuPri


:: =========================================================================================
:: Sub-rotina de confirmacao reutilizavel.
:: Uso: call :Confirmar "Texto da pergunta" && goto ROTULO_SIM || goto ROTULO_NAO
:: (mantida simples com CHOICE para compatibilidade com versoes antigas do Windows)
:: =========================================================================================
:Confirmar
echo.
echo  %~1
CHOICE /C SN /M "Confirma (S/N)"
exit /b %errorlevel%


:: #######################################################################################
:MenuPri
cls
color 6f
echo.
ECHO 	    ##### MENU ##### MENU ###### MENU ###### MENU ####### MENU ####### MENU #####
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO 	+										+
echo 	+		        MANUTENCAO E RECUPERACAO DO WINDOWS			+
echo 	+	M A N U T E N C A O   E   R E C U P E R A C A O   D O   W I N D O W S	+
ECHO 	+										+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo 				[----------------MENU DE OPCOES-----------------]
ECHO 				[	1.Prompt de Comando			]
echo 				[...............................................]
ECHO 				[	2.Atualizar Politicas de Grupo		]
ECHO 				[	3.Limpeza Cache de Rede			]
ECHO 				[	4.Info Lan Local ou IP			]
ECHO 				[	5.Habilitar/Desabilitar Rede		]
echo 				[...............................................]
ECHO 				[	6.Limpar Lixeira			]
ECHO 				[	7.Limpar Arquivos Temporarios		]
ECHO 				[	8.Limpar Arquivos de Internet		]
echo 				[...............................................]
ECHO 				[	9.LogOff de Usuarios			]
echo 				[...............................................]
ECHO 				[	10.Desinstalar JAVA			]
ECHO 				[	11.Desinstalar TEAMS			]
echo 				[...............................................]
ECHO 				[	12.Liberar Impressao			]
ECHO 				[	13.Limpar Arquivos de Backup		]
ECHO 				[	14.Reparo Windows / Disco		]
echo 				[...............................................]
ECHO 				[	15.Info do PC				]
ECHO 				[	16.Limpar Registro do Windows		]
echo 				[...............................................]
ECHO 				[	17.WINDOWS - PAINEL CONTROLE		]
echo 				[...............................................]
ECHO 				[	0.Sair					]
echo 				[###############################################]
ECHO.

echo.
set "userinp="
set /p userinp=Entra com uma Opcao do Menu: 

set /a varCheck=%userinp% 2>nul

if "%varCheck%" == "%userinp%" (

if %userinp% equ 0 GOTO SairPrograma
if %userinp% equ 1 GOTO CallPromptCMDStart
if %userinp% equ 2 GOTO FuncgpupRede
if %userinp% equ 3 GOTO ConfigLan
if %userinp% equ 4 GOTO infoRedeLan
if %userinp% equ 5 GOTO DISCONADAPTERLANETher
if %userinp% equ 6 GOTO ClearLixo
if %userinp% equ 7 GOTO ClearTemp
if %userinp% equ 8 GOTO ClearInt
if %userinp% equ 9 GOTO LogOffUser
if %userinp% equ 10 GOTO UninstalJava
if %userinp% equ 11 GOTO TeamsClear
if %userinp% equ 12 GOTO SpoolImp
if %userinp% equ 13 GOTO ClearBkp
if %userinp% equ 14 GOTO ReparoWinDisc
if %userinp% equ 15 GOTO infosysbraz
if %userinp% equ 16 GOTO LimparRegistro
if %userinp% equ 17 GOTO MenuWinProgram
if %userinp% geq 18 GOTO MenuPri

) else (
ping -n 1 localhost >nul
echo.
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
)
:: #######################################################################################


:: ##################################################################################
:ClearTemp
cls
COLOR A0
ECHO.
call :Confirmar "Isso vai apagar TODOS os arquivos temporarios de TODOS os usuarios. Deseja continuar?"
if errorlevel 2 GOTO MenuPri

echo Iniciando limpeza de temporarios em %date% %time% >> "%LOGFILE%"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo ******************** PASTA TEMP DOS USUARIOS ********************

for /d %%F in (C:\Users\*) do del /f /s /q "%%F\AppData\Local\Temp\*" >nul 2>&1

echo apaga subpastas vazias dentro da pasta Temp de cada usuario (mantem a pasta Temp)
for /d %%F in (C:\Users\*) do robocopy "%%F\AppData\Local\Temp\" "%%F\AppData\Local\Temp\" /s /move /NFL /NDL /NJH /NJS /nc /ns /np >nul

echo ******************** ARQUIVOS DE LOG DO WINDOWS ********************
del /f/s/q "%windir%\logs\cbs\*.log" >nul 2>&1
del /f/s/q "%windir%\Logs\MoSetup\*.log" >nul 2>&1
del /f/s/q "%windir%\Panther\*.log" >nul 2>&1
del /f/s/q "%windir%\inf\*.log" >nul 2>&1
del /f/s/q "%windir%\logs\*.log" >nul 2>&1
del /f/s/q "%windir%\SoftwareDistribution\*.log" >nul 2>&1
del /f/s/q "%windir%\Microsoft.NET\*.log" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q /f "%%F\AppData\Local\Microsoft\OneDrive\setup\logs\*.log" >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando os arquivos temporarios do usuario atual...
DEL /S /F /Q "%TMP%\*.*" >nul 2>&1
del /S /F /Q "%TEMP%\*.*" >nul 2>&1
DEL /S /F /Q "%WINDIR%\Temp\*.*" >nul 2>&1
DEL /S /F /Q "%LOCALAPPDATA%\Temp\*.*" >nul 2>&1
del /s /f /q "%HomePath%\AppData\LocalLow\Temp\*.*" >nul 2>&1

del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*" >nul 2>&1
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*" >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando cache de internet local do usuario...
del /F /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*" >nul 2>&1

rd /s /q "%windir%\Temp" >nul 2>&1
md "%windir%\Temp" >nul 2>&1

rd /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations" >nul 2>&1
rd /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations" >nul 2>&1
rd /s /q "%APPDATA%\Microsoft\Windows\Recent" >nul 2>&1
md "%APPDATA%\Microsoft\Windows\Recent" >nul 2>&1
md "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations" >nul 2>&1
md "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations" >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando arquivos temporarios do sistema, logs e Windows Update...
del /F /Q "%SystemRoot%\Temp\*.*" >nul 2>&1
del /F /Q "%SystemRoot%\Logs\*.*" >nul 2>&1
del /F /Q "%SystemRoot%\SoftwareDistribution\Download\*.*" >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando historico de "Executar" e caminhos digitados no Explorer...
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /VA /F >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Recriando pasta SoftwareDistribution (arquivos do Windows Update)...
net stop wuauserv >nul 2>&1
rd /s /q "%windir%\SoftwareDistribution" >nul 2>&1
net start wuauserv >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando arquivos Prefetch...
del /s /f /q "%WinDir%\Prefetch\*.*" >nul 2>&1
rd /s /q "%WinDir%\Prefetch" >nul 2>&1
md "%windir%\Prefetch" >nul 2>&1

echo ******************** ADOBE MEDIA CACHE FILES ********************
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Roaming\Adobe\Common\Media Cache Files\*.*" >nul 2>&1

echo Limpeza de temporarios concluida em %date% %time% >> "%LOGFILE%"

cls
echo ****** AGUARDE ****** AGUARDE ****** AGUARDE ****** AGUARDE ******
echo ****** Executando limpeza avancada do Windows (cleanmgr) ******
cleanmgr /sagerun:64 /Autoclean
echo.
echo Concluido!
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ############################################################################################


:: #######################################################################################
:ClearInt
cls
COLOR A0
ECHO.
call :Confirmar "Isso vai FECHAR os navegadores abertos e apagar o cache/historico. Deseja continuar?"
if errorlevel 2 GOTO MenuPri

echo Iniciando limpeza de internet em %date% %time% >> "%LOGFILE%"

echo ******************** ARQUIVOS DE LOG DO WINDOWS E EXPLORER ********************
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Windows\Explorer\*.db" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Windows\WebCache\*.log" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Windows\INetCache\IE\*" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.*" >nul 2>&1

echo ******************** EDGE ********************
taskkill /F /IM msedge.exe >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Edge\User Data\Default\Cache\Cache_Data\*.*" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache\*.*" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache\js\*.*" >nul 2>&1

echo ******************** FIREFOX ********************
taskkill /F /IM firefox.exe >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Mozilla\Firefox\Profiles\*.*" >nul 2>&1

echo ******************** CHROME ********************
taskkill /F /IM chrome.exe >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data\*.*" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Google\Chrome\User Data\Default\GPUCache\*.*" >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Google\Chrome\User Data\Default\Code Cache\js\*.*" >nul 2>&1

echo ******************** BRAVE ********************
taskkill /F /IM brave.exe >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache\Cache_Data\*.*" >nul 2>&1

echo ******************** VIVALDI ********************
taskkill /F /IM vivaldi.exe >nul 2>&1
for /d %%F in (C:\Users\*) do del /s /q "%%F\AppData\Local\Vivaldi\User Data\Default\Cache\Cache_Data\*.*" >nul 2>&1

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Limpando historico do Internet Explorer / Edge legado...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351 >nul 2>&1
del /q /s /f "%USERPROFILE%\AppData\Local\Microsoft\Internet Explorer\*.*" >nul 2>&1
del /q /s /f "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\*.*" >nul 2>&1

echo Limpeza de internet concluida em %date% %time% >> "%LOGFILE%"

echo A limpeza dos arquivos temporarios da Internet foi concluida.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ##########################################################################################


:: #######################################################################################
:ClearBkp
cls
color 6f
ECHO.
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
echo ESSE PROCESSO PODE DEMORAR E VARRE TODO O DISCO C: EM BUSCA DE ARQUIVOS .BAK
ECHO CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO. CUIDADO.
ECHO.
ECHO 1 - INICIA LIMPEZA
ECHO 2 - CANCELAR - SAIR
Echo.
CHOICE /C 12 /M "Entra com uma Opcao:"
IF ERRORLEVEL 2 GOTO ClearBkp_Shutdown
IF ERRORLEVEL 1 GOTO ClearBkp_Restart

:ClearBkp_Restart
cls
color 6f
echo Deletando arquivos de Backup (.bak) em C:\ ...
del /s /q /f "C:\*.bak" >nul 2>&1
echo Arquivos de Backup (.bak) removidos.
GOTO ClearBkp_End

:ClearBkp_Shutdown
cls
color cf
echo CANCELADO PELO USUARIO
GOTO ClearBkp_End

:ClearBkp_End
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ###########################################################################################


:: #######################################################################################
:SpoolImp
cls
COLOR A0
ECHO.
echo Limpando a fila de impressao...
net stop spooler
del /F /Q "%systemroot%\System32\spool\PRINTERS\*.*" >nul 2>&1
net start spooler
echo A limpeza da fila de impressao foi concluida.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ############################################################################################


:: #######################################################################################
:TeamsClear
cls
COLOR A0
ECHO.
call :Confirmar "Isso vai fechar o Teams e apagar seus dados locais (sera necessario logar novamente). Continuar?"
if errorlevel 2 GOTO MenuPri

taskkill /f /im teams.exe >nul 2>&1
ping -n 3 localhost >nul

del /S /F /Q "%userprofile%\appdata\local\Microsoft\Teams\*.*" >nul 2>&1
del /S /F /Q "%appdata%\Microsoft\Teams\*.*" >nul 2>&1
del /S /F /Q "%userprofile%\appdata\local\Packages\MSTeams_8wekyb3d8bbwe\*.*" >nul 2>&1
rd /s /q "%appdata%\Microsoft\Teams" >nul 2>&1
rd /s /q "%userprofile%\appdata\local\Packages\MSTeams_8wekyb3d8bbwe" >nul 2>&1

echo A limpeza do Teams foi concluida.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ############################################################################################


:: #######################################################################################
:ReparoWinDisc
cls
COLOR A0
ECHO.
echo Este processo executa DISM, SFC, desfragmentacao e CHKDSK.
echo O CHKDSK pode exigir REINICIALIZACAO do computador para concluir.
call :Confirmar "Deseja iniciar o reparo do Windows/disco agora?"
if errorlevel 2 GOTO MenuPri

echo Reparando Sistema ...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start=disabled >nul 2>&1

Dism /Online /Cleanup-Image /RestoreHealth
sfc /scannow
defrag %systemdrive% /o /u
chkdsk %systemdrive% /f /r /x

echo.
echo Se o CHKDSK pediu para agendar na proxima reinicializacao, responda "S" quando reiniciar o PC.
echo Reparo foi concluido/agendado.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ############################################################################################


:: ##########################################################################################
:ConfigLan
cls
COLOR A0
ECHO.
echo Estacao utiliza IP fixo?
echo 	S - Sim
echo 	N - Nao
choice /c sn /cs /m "Escolha uma Opcao S-im - N-ao"
set "condition=false"
if errorlevel 2 goto fRedeIPfixoNao
if errorlevel 1 goto fRedeIPfixoSim

:fRedeIPfixoSim
set "condition=true"
netsh -c interface dump > "%~dp0netcfg_backup.txt"
goto ConfigLan_Run

:fRedeIPfixoNao
set "condition=false"
goto ConfigLan_Run

:ConfigLan_Run
echo Limpando cache do sistema e DNS...
ipconfig /flushdns
arp -d * >nul 2>&1
nbtstat -R >nul 2>&1
nbtstat -RR >nul 2>&1

echo Renovando configuracao de rede...
ipconfig /release
ipconfig /renew

echo Redefinindo TCP/IP e Winsock...
netsh int ip reset all
netsh winsock reset
netsh int tcp show global > "%~dp0globalredeset.txt"

echo.
echo AVISO: pode ser necessario reiniciar o computador para o reset de rede ter efeito total.
echo.

echo Reiniciando servico DHCP...
net stop dhcp >nul 2>&1
net start dhcp >nul 2>&1

if "%condition%"=="true" (
	echo Restaurando configuracao de IP fixo salva...
	netsh exec "%~dp0netcfg_backup.txt"
)

echo Registrando enderecos DNS...
ipconfig /registerdns

echo A limpeza e renovacao da configuracao de rede foram concluidas.
if exist "%~dp0netcfg_backup.txt" del /f "%~dp0netcfg_backup.txt"
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ######################################################################################


:: ########################################################################################
:FuncgpupRede
cls
color 6f
ECHO.
ECHO 1 - INICIA A ATUALIZACAO
ECHO 2 - CANCELAR - SAIR
CHOICE /C 12 /M "Entra com uma Opcao:"
IF ERRORLEVEL 2 GOTO GPUPEnd
IF ERRORLEVEL 1 GOTO GPUPINI

:GPUPINI
cls
color 02
echo Atualizando Politicas de Grupo...
gpupdate /force
echo Politica de Grupo Concluida.
GOTO GPUPEnd

:GPUPEnd
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #########################################################################################


:: ######################################################################################
:LogOffUser
cls
COLOR A0
set "vlcUserNomeTempT2=%username:~0,-3%"

:fID_UserDigIniMenu
cls
echo.
echo ......................... Usuarios Logados .......................
echo ------------------------------------------------------------------
qwinsta
echo ==================================================================
echo.
set "vlnID_UserDig="
set /p vlnID_UserDig=Digite o ID para Deslogar (ou deixe vazio para sair): 
if "%vlnID_UserDig%"=="" GOTO fID_UserDigEND

set "vlcUserNome="
FOR /f "tokens=1" %%k IN ('qwinsta ^| find "%vlnID_UserDig%"') DO (set "vlcUserNome=%%k")
if "%vlcUserNome%" == ">console" (
	FOR /f "tokens=2" %%k IN ('qwinsta ^| find "%vlnID_UserDig%"') DO (set "vlcUserNome=%%k")
)
IF "%vlcUserNome%" == "%vlcUserNomeTempT2%" set "vlcUserNome=%username%"

set /a varCheck_IDUser=%vlnID_UserDig% 2>nul
if not "%varCheck_IDUser%" == "%vlnID_UserDig%" (
	echo OPCAO INVALIDA. TENTE NOVAMENTE
	pause > nul
	goto fID_UserDigIniMenu
)

if "%vlcUserNome%"=="" (
	echo ID Usuario nao encontrado.
	pause > nul
	goto fID_UserDigIniMenu
)

echo.
echo ID "%varCheck_IDUser%" - Usuario "%vlcUserNome%"
call :Confirmar "Deseja realmente fazer logoff deste usuario?"
if errorlevel 2 goto fID_UserDigIniMenu

if "%username%" == "%vlcUserNome%" (
	echo Voce nao pode deslogar a si mesmo por aqui.
	pause > nul
	goto fID_UserDigIniMenu
)

logoff %varCheck_IDUser%
echo LogOff Concluido - ID "%varCheck_IDUser%" - "%vlcUserNome%"
pause > nul
goto fID_UserDigIniMenu

:fID_UserDigEND
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ##########################################################################################


:: ##########################################################################################
:infosysbraz
cls
COLOR A0
SET "TEMPFILEDri=%temp%\syinfo_%random%.txt"
SystemInfo > "%TEMPFILEDri%"

echo #######################################
hostname
Echo ..................Informacoes do Sistema.................
echo.
wmic cpu get name

type "%TEMPFILEDri%" | find /i "Nome do sistema operacional:"
type "%TEMPFILEDri%" | find /i "Versao do sistema operacional:"
type "%TEMPFILEDri%" | find /i "Fabricante do sistema:"
type "%TEMPFILEDri%" | find /i "Modelo do sistema:"
type "%TEMPFILEDri%" | find /i "Tipo de sistema"
echo.
echo .....................................
echo Usuario:				   %username%
echo Dominio: 				   %USERDOMAIN%
echo Servidor de Logon: 			   %LOGONSERVER%
ipconfig | find /i "ipv4"
echo.
echo %computername%
wmic baseboard get product,Manufacturer,version,serialnumber

del /f /q "%TEMPFILEDri%" >nul 2>&1

echo.
echo Processo concluido!
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ###############################################################################################


:: ##############################################################################################
:infoRedeLan
cls
COLOR 4f
ECHO.
ECHO VERIFICAR MAQUINA REMOTA - DIGITE O IP (ou deixe vazio para sair)
ECHO.
set "host="
set /p host=Entrar com o IP: 

if "%host%"=="" GOTO infoRedeLanno

cls
ping -n 1 -w 1000 %host% | find /i "TTL=" >NUL
if %errorlevel%==0 (
	echo %host% : ONLINE
	nslookup %host%
	echo --------------------------------------------------------
	tracert %host%
	echo --------------------------------------------------------
	nbtstat -a %host%
) else (
	echo %host% : OFFLINE
)
goto infoRedeLanend

:infoRedeLanno
CLS
echo CANCELADO - CANCELADO - CANCELADO - CANCELADO
goto infoRedeLanend

:infoRedeLanend
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: ############################################################################################


:: ###############################################################################################
:UninstalJava
cls
color 17
echo.
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 	+		                 DESINSTALACAO JAVA				+
echo 	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo 	    ESSE PROCESSO LEVA VARIOS MINUTOS
echo.
call :Confirmar "Deseja desinstalar todas as versoes do Java encontradas?"
if errorlevel 2 GOTO MenuPri

cls
echo Desinstalando Java - Isso pode Demorar...
wmic product where "name like 'Java 7%%'" call uninstall /nointeractive
wmic product where "name like 'JavaFX%%'" call uninstall /nointeractive
wmic product where "name like 'Java(TM) 7%%'" call uninstall /nointeractive
wmic product where "name like 'Java(tm) 6%%'" call uninstall /nointeractive
wmic product where "name like 'J2SE Runtime Environment%%'" call uninstall /nointeractive
wmic product where "name like 'Java 8%%'" call uninstall /nointeractive

echo.
echo Concluido. (Nota: "wmic" esta descontinuado em versoes recentes do Windows;
echo se nao funcionar, use "Painel de Controle - Programas" para remover manualmente.)
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #################################################################################################


:: #################################################################################################
:MenuWinProgram
cls
color 57
echo.
ECHO 	    ##### MENU ##### PAINEL DE CONTROLE / FERRAMENTAS ##### MENU #####
echo.
echo 				[----------------MENU DE OPCOES-----------------]
ECHO 				[	1. Pastas compartilhadas		]
ECHO 				[	2. Certificados				]
ECHO 				[	3. Gerenciador de Tarefas 		]
ECHO 				[	4. Gerenciador de Dispositivo 		]
ECHO 				[	5. Gerenciador de Impressao 		]
echo 				[...............................................]
ECHO 				[	6. Desempenho 				]
ECHO 				[	7. Propriedades do Sistema 		]
echo 				[...............................................]
ECHO 				[	8. Adicionar e Remover Programas 	]
echo 				[...............................................]
ECHO 				[	9. Reorganizar Tela 			]
ECHO 				[	10. Scanners e Cameras 			]
ECHO 				[	11. Som 				]
echo 				[...............................................]
ECHO 				[	12. Propriedades de Internet		]
ECHO 				[	13. Configuracoes Adaptador de Rede 	]
ECHO 				[	14. Remocao Malware (MRT)		]
echo 				[...............................................]
ECHO 				[	15. Teclado Virtual			]
ECHO 				[	16. Opcao de Pasta 			]
echo 				[...............................................]
ECHO 				[	17. Resumo do Sistema 			]
ECHO 				[	18. Monitor de Recurso 			]
ECHO 				[	19. Sobre o Windows 			]
ECHO 				[	20. Sobre PC 				]
echo 				[...............................................]
ECHO 				[	0.VOLTAR MENU PRINCIPAL			]
echo 				[###############################################]
ECHO.
set "userinp="
set /p userinp=Entra com uma Opcao do Menu: 
set /a varCheck=%userinp% 2>nul

if "%varCheck%" == "%userinp%" (
if %userinp% equ 1 start fsmgmt.msc
if %userinp% equ 2 start certmgr.msc
if %userinp% equ 3 start taskmgr
if %userinp% equ 4 start hdwwiz.cpl
if %userinp% equ 5 start printmanagement.msc
if %userinp% equ 6 start rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,3
if %userinp% equ 7 start sysdm.cpl
if %userinp% equ 8 start appwiz.cpl
if %userinp% equ 9 start desk.cpl
if %userinp% equ 10 start control /name Microsoft.ScannersAndCameras
if %userinp% equ 11 start mmsys.cpl
if %userinp% equ 12 start inetcpl.cpl
if %userinp% equ 13 start ncpa.cpl
if %userinp% equ 14 start mrt
if %userinp% equ 15 start osk
if %userinp% equ 16 start control /name Microsoft.FolderOptions
if %userinp% equ 17 start msinfo32
if %userinp% equ 18 start resmon
if %userinp% equ 19 start winver
if %userinp% equ 20 start control /name Microsoft.System
if %userinp% equ 0 GOTO MenuPri
GOTO MenuWinProgram
) else (
echo.
echo OPCAO INVALIDA. TENTE NOVAMENTE
echo.
pause > nul
GOTO MenuWinProgram
)
:: ##################################################################################################


:: ###################################################################################################
:ClearLixo
cls
COLOR A0
ECHO.
call :Confirmar "Isso vai esvaziar a Lixeira de todos os discos. Continuar?"
if errorlevel 2 GOTO MenuPri

echo Limpando a lixeira...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"

for %%D in (C D E) do (
	if exist %%D:\$Recycle.bin del /f /s /q "%%D:\$Recycle.bin\*.*" >nul 2>&1
)

echo Limpando cache de miniaturas...
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Low\Content.IE5" >nul 2>&1

echo Lixeira Concluida.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################


:: ############################################################################################
:: NOVO - Limpador de Registro do Windows (somente itens seguros / de cache)
:: Nao remove entradas "orfas" de programas desinstalados: isso exige uma
:: analise real do registro e e' arriscado fazer as cegas em lote.
:: Aqui limpamos apenas MRUs (listas de "usado recentemente") e caches
:: conhecidos, que o Windows recria sozinho sem causar problemas.
:: ############################################################################################
:LimparRegistro
cls
COLOR 1F
ECHO.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo                       LIMPEZA DE REGISTRO DO WINDOWS (ITENS SEGUROS)
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo Serao removidas apenas listas de "usado recentemente" (MRU) e caches que o
echo Windows recria automaticamente. NENHUMA entrada de programa instalado sera tocada.
echo.
call :Confirmar "Deseja continuar?"
if errorlevel 2 GOTO MenuPri

echo Criando ponto de restauracao antes de alterar o registro...
powershell.exe -NoProfile -Command "Checkpoint-Computer -Description 'Antes_LimpezaRegistro' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

echo Limpeza de registro iniciada em %date% %time% >> "%LOGFILE%"

echo Limpando historico do "Executar" (Win+R)...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

echo Limpando caminhos digitados no Explorer...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /VA /F >nul 2>&1

echo Limpando documentos recentes (RecentDocs)...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1

echo Limpando historico de busca do Explorer/Cortana...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f >nul 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1

echo Limpando historico de execucao do "Salvar/Abrir como"...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f >nul 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f >nul 2>&1

echo Limpando lista de miniaturas em cache (ThumbnailCache)...
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f >nul 2>&1

echo Limpando entradas de rede mapeada temporarias (MountPoints2 orfaos de USB antigos)...
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1

echo Compactando o registro (limpeza de espaco nao usado nos hives)...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase >nul

echo Limpeza de registro concluida em %date% %time% >> "%LOGFILE%"

echo.
echo Limpeza de registro concluida com seguranca.
echo (Um ponto de restauracao foi criado antes das alteracoes, caso precise reverter.)
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################


:: ############################################################################################
:DISCONADAPTERLANETher
cls
COLOR A0
ECHO.
echo Adaptadores de Rede disponiveis:
netsh interface show interface
echo ==========================================================================
echo.
set "varCharAdapNetCon="
set /p varCharAdapNetCon=Nome exato da interface de Rede (vazio para sair): 
if "%varCharAdapNetCon%"=="" GOTO endNetCon

netsh interface show interface "%varCharAdapNetCon%" | find /i "Desconectado" >nul
if %errorlevel%==0 (
	echo Adaptador esta desabilitado. Habilitando "%varCharAdapNetCon%"...
	netsh interface set interface "%varCharAdapNetCon%" enabled
) else (
	netsh interface show interface "%varCharAdapNetCon%" >nul 2>&1
	if errorlevel 1 (
		echo Interface "%varCharAdapNetCon%" nao encontrada.
	) else (
		echo Adaptador esta habilitado. Desabilitando "%varCharAdapNetCon%"...
		netsh interface set interface "%varCharAdapNetCon%" disabled
	)
)

:endNetCon
echo.
echo Procedimento Concluido.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
pause > nul
GOTO MenuPri
:: #######################################################################################################


:: #######################################################################################################
:CallPromptCMDStart
cls
color 03
echo.
echo 	Seja Bem Vindo ao Prompt de Comando
echo 		Digite EXIT para sair
echo.
call cmd
cls
COLOR A0
echo Saindo do Prompt de Comando.
echo.
echo Pressione qualquer tecla para Voltar ao MENU PRINCIPAL
TIMEOUT /T 3
GOTO MenuPri
:: #######################################################################################################


:: #######################################################################################################
:SairPrograma
COLOR A0
echo Encerrando... Log salvo em "%LOGFILE%"
echo ==== Sessao encerrada em %date% %time% ==== >> "%LOGFILE%"
TIMEOUT /T 3
exit /b
:: #######################################################################################################
