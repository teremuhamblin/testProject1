# testProject1_Launcher.ps1 - Lanceur principal
# Usage : .\testProject1_Launcher.ps1
# Usage test : .\testProject1_Launcher.ps1 -TestOnly
param(
    [switch]$TestOnly,
    [switch]$Wrapper,
    [switch]$Silent
)

# --- 1. Verifie Admin ---
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $IsAdmin) {
    Write-Host "Relance en Administrateur..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`" -Wrapper:$Wrapper" -Verb RunAs
    exit
}

# --- 2. Verifie Windows 10 ---
$OS = Get-CimInstance Win32_OperatingSystem
Write-Host "OS detecte : $($OS.Caption) - Build $($OS.BuildNumber)" -ForegroundColor Cyan
if ($OS.Caption -notmatch "Windows 10") {
    Write-Host "Attention : Ce script est prevu pour Windows 10 !" -ForegroundColor Red
    $r = Read-Host "Continuer quand meme ? (o/n)"
    if ($r -ne "o") { exit }
}

# --- 3. Mode Wrapper ? ---
if ($Wrapper) {
    & "$PSScriptRoot\testProject1_Wrapper_Complet.ps1"
    exit
}

# --- 4. Point de restauration avant de tout appliquer ---
if (-not $TestOnly) {
    Write-Host "Creation point de restauration..." -ForegroundColor Yellow
    try {
        Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
        Checkpoint-Computer -Description "testProject1 avant lancement" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
        Write-Host "Point de restauration OK" -ForegroundColor Green
    } catch {
        Write-Host "Impossible de creer le point de restauration, on continue..." -ForegroundColor DarkYellow
    }
}

# --- 5. Import module ---
Write-Host "Chargement du module testProject1..." -ForegroundColor Cyan
Import-Module "$PSScriptRoot\Module\testProject1.psm1" -Force

# --- 6. Liste des 150 fonctions a lancer dans l'ordre ---
$AllFunctions = @(
    # PRIVACY
    "DisableTelemetry","DisableAdvertisingID","DisableActivityHistory","DisableLocation","DisableDiagnostics",
    "DisableFeedback","DisableTailoredExperiences","DisableClipboardHistory","DisableCopilot","DisableRecall",
    "DisableWidgets","DisableNewsFeed","DisableSearchHighlights","DisableTaskbarWidgets","DisableWindowsInk",
    "DisableAppLaunchTracking","DisableStepsRecorder","DisableErrorReporting","DisableCustomerExperience","DisableInventoryCollector",
    "DisableMapUpdates","DisableFindMyDevice","DisableAdvertisingInfo","DisableSmartScreenApp","DisableSearchBoxSuggestions",
    # UI
    "EnableDarkTheme","ShowFileExtensions","ShowHiddenFiles","DisableBingSearch","ShowThisPC",
    "ShowRecycleBin","DisableSnapAssist","AlignTaskbarLeft","DisableTaskbarSearch","HideTaskView",
    "DisableTransparency","SetExplorerThisPC","DisableRecentFiles","DisableFrequentFolders",
    # SYSTEME
    "DisableHibernation","SetPowerPlanUltimate","EnableRestorePoint","DisableAutoRestart","DisableDriverUpdate",
    "DisableDeliveryOptimization","SetDNSCloudflare","DisableRemoteAssistance","DisableAutoPlay","SetVisualEffectsPerformance",
    "DisableStartupDelay","EnableLongPath",
    # SECURITE
    "EnableDefenderSandbox","SetUACDefault","EnableControlledFolder","EnableRansomwareProtection","DisableSMBv1",
    "EnableFirewall","DisableGuestAccount","DisableLMHash","DisableAdminShares",
    # GAMING
    "DisableGameDVR","DisableGameMode","DisableGameBar","DisableFullscreenOptimizations","DisableMouseAcceleration",
    # CONTEXT MENU
    "AddContextMenuTerminal","EnableClassicContextMenu","AddTakeOwnership",
    # APPS
    "UninstallOneDrive","UninstallXboxApps","UninstallCortana","UninstallOneNote","UninstallSkype",
    "UninstallTeams","UninstallSolitaire","UninstallNews","UninstallWeather","UninstallMaps",
    "UninstallPaint3D","UninstallMixedReality","UninstallStickyNotes","UninstallYourPhone","UninstallGetHelp",
    "UninstallFeedbackHub","UninstallBingWallpaper","UninstallTikTok",
    # MAINTENANCE
    "CreateCleanupTask","DisableScheduledDefrag","DisableTelemetryTasks","ClearTempFiles","ClearWindowsUpdateCache",
    "ClearEventLogs","OptimizeDrives","DisableSuperfetch"
)

# --- 7. Execution ---
$Success = 0
$Failed = 0
$LogFile = "$PSScriptRoot\testProject1_log.txt"
"=== testProject1 - $(Get-Date) ===" | Out-File $LogFile

foreach ($Func in $AllFunctions) {
    if ($TestOnly) {
        if (Get-Command $Func -ErrorAction SilentlyContinue) {
            Write-Host "[TEST] $Func existe - OK" -ForegroundColor DarkGray
        } else {
            Write-Host "[TEST] $Func MANQUANT !" -ForegroundColor Red
        }
        continue
    }
    try {
        Write-Host "Execution : $Func..." -ForegroundColor White
        Invoke-Expression $Func
        Add-Content $LogFile "OK - $Func"
        $Success++
    } catch {
        Write-Host "Erreur : $Func - $_" -ForegroundColor Red
        Add-Content $LogFile "ERREUR - $Func - $_"
        $Failed++
    }
}

# --- 8. Fin ---
Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "testProject1 TERMINE !" -ForegroundColor Green
Write-Host "Reussies : $Success / Echouees : $Failed" -ForegroundColor Green
Write-Host "Log : $LogFile" -ForegroundColor Cyan
Write-Host "Redemarre ton PC pour appliquer tout." -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Green

if (-not $Silent) {
    Read-Host "Appuie sur ENTREE pour fermer"
}
