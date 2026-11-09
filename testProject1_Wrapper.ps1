Add-Type -AssemblyName PresentationFramework
Import-Module "$PSScriptRoot\Module\testProject1.psm1" -Force
# Le XAML avec les CheckBox appelle automatiquement les 150 fonctions par nom
# Ex: chk_DisableTelemetry -> DisableTelemetry()
