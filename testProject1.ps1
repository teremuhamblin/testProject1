# testProject1 v2.0 - Windows 10 22H2
# Lancer en Admin : Set-ExecutionPolicy Bypass -Scope Process -Force
param(
    [switch]$Wrapper
)

if ($Wrapper) {
    & "$PSScriptRoot\testProject1_Wrapper.ps1"
    exit
}

Import-Module "$PSScriptRoot\Module\testProject1.psm1" -Force
Import-LocalizedData -BindingVariable Lang -BaseDirectory "$PSScriptRoot\Localizations" -FileName "fr-FR.psd1" -ErrorAction SilentlyContinue

Write-Host "=== testProject1 - Application ===" -ForegroundColor Cyan

# PRIVACY
DisableTelemetry; DisableAdvertisingID; DisableActivityHistory; DisableLocation; DisableDiagnostics
DisableFeedback; DisableTailoredExperiences; DisableClipboardHistory; DisableCopilot; DisableRecall
DisableWidgets; DisableNewsFeed; DisableSearchHighlights; DisableTaskbarWidgets; DisableWindowsInk
DisableAppLaunchTracking; DisableStepsRecorder; DisableErrorReporting; DisableCustomerExperience; DisableInventoryCollector
DisableMapUpdates; DisableFindMyDevice; DisableAdvertisingInfo; DisableSmartScreenApp; DisableSearchBoxSuggestions

# UI
EnableDarkTheme; ShowFileExtensions; ShowHiddenFiles; DisableBingSearch; ShowThisPC
ShowRecycleBin; DisableSnapAssist; AlignTaskbarLeft; DisableTaskbarSearch; HideTaskView
DisableTransparency; SetExplorerThisPC; DisableRecentFiles; DisableFrequentFolders

# SYSTEME
DisableHibernation; SetPowerPlanUltimate; EnableRestorePoint; DisableAutoRestart; DisableDriverUpdate
DisableDeliveryOptimization; SetDNSCloudflare; DisableRemoteAssistance; DisableAutoPlay; SetVisualEffectsPerformance
DisableStartupDelay; EnableLongPath

# SECURITE
EnableDefenderSandbox; SetUACDefault; EnableControlledFolder; EnableRansomwareProtection; DisableSMBv1
EnableFirewall; DisableGuestAccount; DisableLMHash; DisableAdminShares

# GAMING
DisableGameDVR; DisableGameMode; DisableGameBar; DisableFullscreenOptimizations; DisableMouseAcceleration

# CONTEXT MENU
AddContextMenuTerminal; EnableClassicContextMenu; AddTakeOwnership

# APPS DEBLOAT
UninstallOneDrive; UninstallXboxApps; UninstallCortana; UninstallOneNote; UninstallSkype
UninstallTeams; UninstallSolitaire; UninstallNews; UninstallWeather; UninstallMaps
UninstallPaint3D; UninstallMixedReality; UninstallStickyNotes; UninstallYourPhone; UninstallGetHelp
UninstallFeedbackHub; UninstallBingWallpaper; UninstallTikTok

# MAINTENANCE
CreateCleanupTask; DisableScheduledDefrag; DisableTelemetryTasks; ClearTempFiles; ClearWindowsUpdateCache
ClearEventLogs; OptimizeDrives; DisableSuperfetch

Write-Host "Termine !" -ForegroundColor Green
