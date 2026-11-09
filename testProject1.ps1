# testProject1
- Pour Windows 10 22H2
# Script - open Source

# Import du module
Import-Module -Name "$PSScriptRoot\Module\testProject1.psm1" -Force

# ========== PRIVACY & TELEMETRY ==========
DisableTelemetry
DisableAdvertisingID
DisableActivityHistory
DisableLocation

# ========== UI & PERSONNALISATION ==========
EnableDarkTheme
ShowFileExtensions
ShowHiddenFiles
DisableBingSearch

# ========== SYSTEME ==========
DisableHibernation
SetPowerPlanUltimate
EnableRestorePoint

# ========== APPS - DEBLOAT ==========
UninstallOneDrive
UninstallXboxApps
UninstallCortana

# ========== SECURITE ==========
EnableDefenderSandbox
SetUACDefault

# ========== TACHES ==========
CreateCleanupTask
