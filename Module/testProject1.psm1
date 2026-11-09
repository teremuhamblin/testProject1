# testProject1.psm1 v2.0 - 150 fonctions
function Set-Reg { param($Path,$Name,$Value,$Type="DWord") if(!(Test-Path $Path)){New-Item $Path -Force|Out-Null} Set-ItemProperty -Path $Path -Name $Name -Value $Value -Force -ErrorAction SilentlyContinue }
function Remove-App { param($Pattern) Get-AppxPackage -Name $Pattern -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue; Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where DisplayName -like $Pattern | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue }

# --- PRIVACY 1-25 ---
function DisableTelemetry { Stop-Service DiagTrack -Force -EA SilentlyContinue; Set-Service DiagTrack -StartupType Disabled -EA SilentlyContinue; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" AllowTelemetry 0 }
function EnableTelemetry { Set-Service DiagTrack -StartupType Automatic -EA SilentlyContinue; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" AllowTelemetry 1 }
function DisableAdvertisingID { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" Enabled 0 }
function DisableActivityHistory { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" EnableActivityFeed 0 }
function DisableLocation { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" DisableLocation 1 }
function DisableDiagnostics { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" AllowTelemetry 0 }
function DisableFeedback { Set-Reg "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" NumberOfSIUFInPeriod 0 }
function DisableTailoredExperiences { Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" DisableTailoredExperiencesWithDiagnosticData 1 }
function DisableClipboardHistory { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" AllowClipboardHistory 0 }
function DisableCopilot { Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" TurnOffWindowsCopilot 1 }
function DisableRecall { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" DisableAIDataAnalysis 1 }
function DisableWidgets { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" AllowNewsAndInterests 0 }
function DisableNewsFeed { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" AllowNewsAndInterests 0 }
function DisableSearchHighlights { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" IsDynamicSearchBoxEnabled 0 }
function DisableTaskbarWidgets { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarDa 0 }
function DisableWindowsInk { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" AllowWindowsInkWorkspace 0 }
function DisableAppLaunchTracking { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Start_TrackProgs 0 }
function DisableStepsRecorder { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" DisableInventory 1 }
function DisableErrorReporting { Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" Disabled 1 }
function DisableCustomerExperience { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" CEIPEnable 0 }
function DisableInventoryCollector { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" DisableInventory 1 }
function DisableMapUpdates { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps" AutoDownloadAndUpdateMapData 0 }
function DisableFindMyDevice { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\FindMyDevice" AllowFindMyDevice 0 }
function DisableAdvertisingInfo { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" Enabled 0 }
function DisableSmartScreenApp { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" EnableSmartScreen 0 }
function DisableSearchBoxSuggestions { Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" DisableSearchBoxSuggestions 1 }

# --- UI 26-50 ---
function EnableDarkTheme { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" AppsUseLightTheme 0; Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" SystemUsesLightTheme 0 }
function DisableDarkTheme { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" AppsUseLightTheme 1; Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" SystemUsesLightTheme 1 }
function ShowFileExtensions { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" HideFileExt 0 }
function HideFileExtensions { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" HideFileExt 1 }
function ShowHiddenFiles { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Hidden 1 }
function HideHiddenFiles { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Hidden 2 }
function DisableBingSearch { Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" DisableSearchBoxSuggestions 1 }
function EnableBingSearch { Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" DisableSearchBoxSuggestions 0 }
function ShowThisPC { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" 0 }
function ShowRecycleBin { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" "{645FF040-5081-101B-9F08-00AA002F954E}" 0 }
function DisableSnapAssist { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" EnableSnapAssistFlyout 0 }
function EnableSnapAssist { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" EnableSnapAssistFlyout 1 }
function SetTaskbarSmall { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarSmallIcons 1 }
function SetTaskbarLarge { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarSmallIcons 0 }
function AlignTaskbarLeft { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarAl 0 }
function AlignTaskbarCenter { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarAl 1 }
function DisableTaskbarSearch { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" SearchboxTaskbarMode 0 }
function EnableTaskbarSearch { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" SearchboxTaskbarMode 1 }
function HideTaskView { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ShowTaskViewButton 0 }
function ShowTaskView { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ShowTaskViewButton 1 }
function DisableTransparency { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" EnableTransparency 0 }
function EnableTransparency { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" EnableTransparency 1 }
function SetExplorerThisPC { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" LaunchTo 1 }
function SetExplorerQuickAccess { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" LaunchTo 2 }
function DisableRecentFiles { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" ShowRecent 0 }
function DisableFrequentFolders { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" ShowFrequent 0 }

# --- SYSTEME 51-75 ---
function DisableHibernation { powercfg /hibernate off }
function EnableHibernation { powercfg /hibernate on }
function SetPowerPlanUltimate { powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 }
function SetPowerPlanBalanced { powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e }
function EnableRestorePoint { Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue }
function DisableRestorePoint { Disable-ComputerRestore -Drive "C:\" -EA SilentlyContinue }
function DisableAutoRestart { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" NoAutoRebootWithLoggedOnUsers 1 }
function DisableWindowsUpdateAuto { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" NoAutoUpdate 1 }
function EnableWindowsUpdateAuto { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" NoAutoUpdate 0 }
function DisableDriverUpdate { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" ExcludeWUDriversInQualityUpdate 1 }
function DisableDeliveryOptimization { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" DODownloadMode 0 }
function SetDNSGoogle { Set-DnsClientServerAddress -InterfaceAlias "Ethernet*" -ServerAddresses ("8.8.8.8","8.8.4.4") -EA SilentlyContinue }
function SetDNSCloudflare { Set-DnsClientServerAddress -InterfaceAlias "Ethernet*" -ServerAddresses ("1.1.1.1","1.0.0.1") -EA SilentlyContinue }
function DisableIPv6 { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" DisabledComponents 255 }
function EnableIPv6 { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" DisabledComponents 0 }
function DisableRemoteAssistance { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" fAllowToGetHelp 0 }
function DisableRemoteDesktop { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" fDenyTSConnections 1 }
function EnableRemoteDesktop { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" fDenyTSConnections 0 }
function DisableAutoPlay { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" DisableAutoplay 1 }
function EnableAutoPlay { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" DisableAutoplay 0 }
function DisableUSBAutorun { Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" NoDriveTypeAutoRun 255 }
function SetVisualEffectsPerformance { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" VisualFXSetting 3 }
function SetVisualEffectsAppearance { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" VisualFXSetting 1 }
function DisableStartupDelay { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" StartupDelayInMSec 0 }
function EnableLongPath { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" LongPathsEnabled 1 }

# --- SECURITE 76-95 ---
function EnableDefenderSandbox { Set-MpPreference -EnableControlledFolderAccess Enabled -EA SilentlyContinue }
function DisableDefenderSandbox { Set-MpPreference -EnableControlledFolderAccess Disabled -EA SilentlyContinue }
function SetUACDefault { Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" ConsentPromptBehaviorAdmin 5 }
function SetUACNeverNotify { Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" ConsentPromptBehaviorAdmin 0 }
function EnableControlledFolder { Set-MpPreference -EnableControlledFolderAccess Enabled -EA SilentlyContinue }
function DisableControlledFolder { Set-MpPreference -EnableControlledFolderAccess Disabled -EA SilentlyContinue }
function EnableRansomwareProtection { Set-MpPreference -EnableControlledFolderAccess Enabled -EA SilentlyContinue }
function DisableSMBv1 { Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart -EA SilentlyContinue }
function EnableSMBv1 { Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart -EA SilentlyContinue }
function EnableFirewall { Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True }
function DisableFirewall { Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False }
function DisableGuestAccount { net user Guest /active:no }
function EnableWindowsHello { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" AllowDomainPINLogon 1 }
function DisableBiometrics { Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics" Enabled 0 }
function EnableSecureBootCheck { Confirm-SecureBootUEFI -EA SilentlyContinue }
function DisableLMHash { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" NoLMHash 1 }
function EnableCredentialGuard { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" LsaCfgFlags 1 }
function DisableAdminShares { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" AutoShareServer 0 }
function EnableExploitProtection { Set-ProcessMitigation -System -Enable DEP,SEHOP -EA SilentlyContinue }
function DisablePowerShellv2 { Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2 -NoRestart -EA SilentlyContinue }

# --- GAMING 96-105 ---
function DisableGameDVR { Set-Reg "HKCU:\System\GameConfigStore" GameDVR_Enabled 0; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" AllowGameDVR 0 }
function EnableGameDVR { Set-Reg "HKCU:\System\GameConfigStore" GameDVR_Enabled 1 }
function DisableGameMode { Set-Reg "HKCU:\SOFTWARE\Microsoft\GameBar" AllowAutoGameMode 0 }
function EnableGameMode { Set-Reg "HKCU:\SOFTWARE\Microsoft\GameBar" AllowAutoGameMode 1 }
function DisableGameBar { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" AppCaptureEnabled 0 }
function EnableGameBar { Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" AppCaptureEnabled 1 }
function DisableFullscreenOptimizations { Set-Reg "HKCU:\System\GameConfigStore" GameDVR_FSEBehaviorMode 2 }
function EnableFullscreenOptimizations { Set-Reg "HKCU:\System\GameConfigStore" GameDVR_FSEBehaviorMode 0 }
function SetGPUPriorityGames { Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8 }
function DisableMouseAcceleration { Set-Reg "HKCU:\Control Panel\Mouse" MouseSpeed 0; Set-Reg "HKCU:\Control Panel\Mouse" MouseThreshold1 0 }

# --- CONTEXT MENU 106-115 ---
function AddContextMenuTerminal { New-Item -Path "HKCU:\SOFTWARE\Classes\Directory\shell\OpenTerminal" -Force|Out-Null; Set-ItemProperty -Path "HKCU:\SOFTWARE\Classes\Directory\shell\OpenTerminal" -Name "(Default)" -Value "Ouvrir Terminal ici" }
function RemoveContextMenuTerminal { Remove-Item -Path "HKCU:\SOFTWARE\Classes\Directory\shell\OpenTerminal" -Recurse -Force -EA SilentlyContinue }
function AddContextMenuNotepad { New-Item -Path "HKCU:\SOFTWARE\Classes\*\shell\Notepad" -Force|Out-Null; Set-ItemProperty -Path "HKCU:\SOFTWARE\Classes\*\shell\Notepad" -Name "(Default)" -Value "Ouvrir avec Notepad" }
function RemoveContextMenuNotepad { Remove-Item -Path "HKCU:\SOFTWARE\Classes\*\shell\Notepad" -Recurse -Force -EA SilentlyContinue }
function EnableClassicContextMenu { Set-Reg "HKCU:\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" "(Default)" "" }
function DisableClassicContextMenu { Remove-Item -Path "HKCU:\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -Force -EA SilentlyContinue }
function AddTakeOwnership { New-Item -Path "HKCU:\SOFTWARE\Classes\*\shell\TakeOwnership" -Force|Out-Null }
function RemoveTakeOwnership { Remove-Item -Path "HKCU:\SOFTWARE\Classes\*\shell\TakeOwnership" -Recurse -Force -EA SilentlyContinue }
function AddOpenWithNotepad { AddContextMenuNotepad }
function RemoveOpenWithNotepad { RemoveContextMenuNotepad }

# --- APPS 116-135 ---
function UninstallOneDrive { Stop-Process -Name OneDrive -Force -EA SilentlyContinue; Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" "/uninstall" -Wait -EA SilentlyContinue }
function InstallOneDrive { Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -Wait -EA SilentlyContinue }
function UninstallXboxApps { Remove-App "*Xbox*" }
function UninstallCortana { Remove-App "*Cortana*" }
function UninstallOneNote { Remove-App "*OneNote*" }
function UninstallSkype { Remove-App "*Skype*" }
function UninstallTeams { Remove-App "*Teams*" }
function UninstallSolitaire { Remove-App "*Solitaire*" }
function UninstallNews { Remove-App "*BingNews*" }
function UninstallWeather { Remove-App "*BingWeather*" }
function UninstallMaps { Remove-App "*WindowsMaps*" }
function UninstallPaint3D { Remove-App "*Paint3D*" }
function UninstallMixedReality { Remove-App "*MixedReality*" }
function UninstallStickyNotes { Remove-App "*StickyNotes*" }
function UninstallYourPhone { Remove-App "*YourPhone*" }
function UninstallGetHelp { Remove-App "*GetHelp*" }
function UninstallFeedbackHub { Remove-App "*FeedbackHub*" }
function UninstallEdge { Remove-App "*Edge*" }
function UninstallBingWallpaper { Remove-App "*BingWallpaper*" }
function UninstallTikTok { Remove-App "*TikTok*" }

# --- MAINTENANCE 136-150 ---
function CreateCleanupTask { $A=New-ScheduledTaskAction -Execute "cleanmgr.exe" -Argument "/sagerun:1"; $T=New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 3am; Register-ScheduledTask -Action $A -Trigger $T -TaskName "testProject1 Cleanup" -Force -EA SilentlyContinue }
function RemoveCleanupTask { Unregister-ScheduledTask -TaskName "testProject1 Cleanup" -Confirm:$false -EA SilentlyContinue }
function CreateRestorePointTask { $A=New-ScheduledTaskAction -Execute "powershell.exe" -Argument "Checkpoint-Computer -Description 'testProject1'"; $T=New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 2am; Register-ScheduledTask -Action $A -Trigger $T -TaskName "testProject1 Restore" -Force -EA SilentlyContinue }
function DisableScheduledDefrag { Disable-ScheduledTask -TaskName "ScheduledDefrag" -TaskPath "\Microsoft\Windows\Defrag\" -EA SilentlyContinue }
function EnableScheduledDefrag { Enable-ScheduledTask -TaskName "ScheduledDefrag" -TaskPath "\Microsoft\Windows\Defrag\" -EA SilentlyContinue }
function DisableTelemetryTasks { Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" -EA SilentlyContinue | Disable-ScheduledTask -EA SilentlyContinue }
function CreateWSLInstallTask { wsl --install -d Ubuntu -EA SilentlyContinue }
function ClearTempFiles { Remove-Item "$env:TEMP\*" -Recurse -Force -EA SilentlyContinue; Remove-Item "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue }
function ClearWindowsUpdateCache { Stop-Service wuauserv -Force -EA SilentlyContinue; Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -EA SilentlyContinue; Start-Service wuauserv -EA SilentlyContinue }
function ClearEventLogs { wevtutil el | ForEach-Object { wevtutil cl $_ } -EA SilentlyContinue }
function OptimizeDrives { Optimize-Volume -DriveLetter C -Defrag -EA SilentlyContinue }
function DisableSuperfetch { Stop-Service SysMain -Force -EA SilentlyContinue; Set-Service SysMain -StartupType Disabled -EA SilentlyContinue }
function EnableSuperfetch { Set-Service SysMain -StartupType Automatic -EA SilentlyContinue; Start-Service SysMain -EA SilentlyContinue }
function DisableSysMain { DisableSuperfetch }
function EnableSysMain { EnableSuperfetch }

Export-ModuleMember -Function *
