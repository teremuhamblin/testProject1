# testProject1 Wrapper Complet v2.0 - 150 fonctions - Windows 10
# Lancer en Admin
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

Import-Module "$PSScriptRoot\Module\testProject1.psm1" -Force -ErrorAction SilentlyContinue

# --- LISTE DES 150 FONCTIONS + LABELS FR ---
$Groups = @(
    @{ Title="1. PRIVACY & TELEMETRIE (25)"; Items=@(
        @("DisableTelemetry","Désactiver Télémétrie (DiagTrack)"),
        @("DisableAdvertisingID","Désactiver Advertising ID"),
        @("DisableActivityHistory","Désactiver Historique d'activité"),
        @("DisableLocation","Désactiver Localisation"),
        @("DisableDiagnostics","Désactiver Données de diagnostic"),
        @("DisableFeedback","Désactiver Feedback / SIUF"),
        @("DisableTailoredExperiences","Désactiver Expériences personnalisées"),
        @("DisableClipboardHistory","Désactiver Historique presse-papiers"),
        @("DisableCopilot","Désactiver Copilot"),
        @("DisableRecall","Désactiver Recall / AI"),
        @("DisableWidgets","Désactiver Widgets"),
        @("DisableNewsFeed","Désactiver Fil d'actualités"),
        @("DisableSearchHighlights","Désactiver Highlights recherche"),
        @("DisableTaskbarWidgets","Désactiver Widgets barre des tâches"),
        @("DisableWindowsInk","Désactiver Windows Ink"),
        @("DisableAppLaunchTracking","Désactiver Suivi lancement apps"),
        @("DisableStepsRecorder","Désactiver Enregistreur d'étapes"),
        @("DisableErrorReporting","Désactiver Rapport d'erreurs"),
        @("DisableCustomerExperience","Désactiver Customer Experience"),
        @("DisableInventoryCollector","Désactiver Collecteur d'inventaire"),
        @("DisableMapUpdates","Désactiver MAJ auto Cartes"),
        @("DisableFindMyDevice","Désactiver Localiser mon appareil"),
        @("DisableAdvertisingInfo","Désactiver Infos publicitaires"),
        @("DisableSmartScreenApp","Désactiver SmartScreen Apps"),
        @("DisableSearchBoxSuggestions","Désactiver Suggestions recherche")
    )},
    @{ Title="2. UI & PERSONNALISATION (25)"; Items=@(
        @("EnableDarkTheme","Activer Thème sombre"),
        @("DisableDarkTheme","Désactiver Thème sombre"),
        @("ShowFileExtensions","Afficher extensions fichiers"),
        @("HideFileExtensions","Masquer extensions fichiers"),
        @("ShowHiddenFiles","Afficher fichiers cachés"),
        @("HideHiddenFiles","Masquer fichiers cachés"),
        @("DisableBingSearch","Désactiver Bing dans recherche"),
        @("EnableBingSearch","Activer Bing dans recherche"),
        @("ShowThisPC","Afficher Ce PC sur bureau"),
        @("ShowRecycleBin","Afficher Corbeille sur bureau"),
        @("DisableSnapAssist","Désactiver Snap Assist"),
        @("EnableSnapAssist","Activer Snap Assist"),
        @("SetTaskbarSmall","Barre des tâches petite"),
        @("SetTaskbarLarge","Barre des tâches grande"),
        @("AlignTaskbarLeft","Aligner barre à gauche"),
        @("AlignTaskbarCenter","Aligner barre au centre"),
        @("DisableTaskbarSearch","Masquer recherche barre"),
        @("EnableTaskbarSearch","Afficher recherche barre"),
        @("HideTaskView","Masquer Task View"),
        @("ShowTaskView","Afficher Task View"),
        @("DisableTransparency","Désactiver Transparence"),
        @("EnableTransparency","Activer Transparence"),
        @("SetExplorerThisPC","Explorateur -> Ce PC"),
        @("SetExplorerQuickAccess","Explorateur -> Accès rapide"),
        @("DisableRecentFiles","Désactiver Fichiers récents"),
        @("DisableFrequentFolders","Désactiver Dossiers fréquents")
    )},
    @{ Title="3. SYSTEME (25)"; Items=@(
        @("DisableHibernation","Désactiver Hibernation"),
        @("EnableHibernation","Activer Hibernation"),
        @("SetPowerPlanUltimate","Plan d'alimentation Ultimate"),
        @("SetPowerPlanBalanced","Plan d'alimentation Équilibré"),
        @("EnableRestorePoint","Activer Points de restauration"),
        @("DisableRestorePoint","Désactiver Points de restauration"),
        @("DisableAutoRestart","Désactiver Redémarrage auto"),
        @("DisableWindowsUpdateAuto","Désactiver MAJ auto Windows"),
        @("EnableWindowsUpdateAuto","Activer MAJ auto Windows"),
        @("DisableDriverUpdate","Désactiver MAJ auto Drivers"),
        @("DisableDeliveryOptimization","Désactiver Delivery Optimization"),
        @("SetDNSGoogle","DNS Google 8.8.8.8"),
        @("SetDNSCloudflare","DNS Cloudflare 1.1.1.1"),
        @("DisableIPv6","Désactiver IPv6"),
        @("EnableIPv6","Activer IPv6"),
        @("DisableRemoteAssistance","Désactiver Assistance à distance"),
        @("DisableRemoteDesktop","Désactiver Bureau à distance"),
        @("EnableRemoteDesktop","Activer Bureau à distance"),
        @("DisableAutoPlay","Désactiver Lecture auto"),
        @("EnableAutoPlay","Activer Lecture auto"),
        @("DisableUSBAutorun","Désactiver Autorun USB"),
        @("SetVisualEffectsPerformance","Effets visuels -> Performance"),
        @("SetVisualEffectsAppearance","Effets visuels -> Apparence"),
        @("DisableStartupDelay","Désactiver Délai démarrage"),
        @("EnableLongPath","Activer Chemins longs")
    )},
    @{ Title="4. SECURITE (20)"; Items=@(
        @("EnableDefenderSandbox","Activer Defender Sandbox"),
        @("DisableDefenderSandbox","Désactiver Defender Sandbox"),
        @("SetUACDefault","UAC par défaut"),
        @("SetUACNeverNotify","UAC ne jamais notifier"),
        @("EnableControlledFolder","Activer Dossiers contrôlés"),
        @("DisableControlledFolder","Désactiver Dossiers contrôlés"),
        @("EnableRansomwareProtection","Activer Anti-Ransomware"),
        @("DisableSMBv1","Désactiver SMBv1"),
        @("EnableSMBv1","Activer SMBv1"),
        @("EnableFirewall","Activer Pare-feu"),
        @("DisableFirewall","Désactiver Pare-feu"),
        @("DisableGuestAccount","Désactiver Compte Invité"),
        @("EnableWindowsHello","Activer Windows Hello"),
        @("DisableBiometrics","Désactiver Biométrie"),
        @("EnableSecureBootCheck","Vérifier Secure Boot"),
        @("DisableLMHash","Désactiver LM Hash"),
        @("EnableCredentialGuard","Activer Credential Guard"),
        @("DisableAdminShares","Désactiver Partages Admin"),
        @("EnableExploitProtection","Activer Exploit Protection"),
        @("DisablePowerShellv2","Désactiver PowerShell v2")
    )},
    @{ Title="5. GAMING (10)"; Items=@(
        @("DisableGameDVR","Désactiver Game DVR"),
        @("EnableGameDVR","Activer Game DVR"),
        @("DisableGameMode","Désactiver Game Mode"),
        @("EnableGameMode","Activer Game Mode"),
        @("DisableGameBar","Désactiver Game Bar"),
        @("EnableGameBar","Activer Game Bar"),
        @("DisableFullscreenOptimizations","Désactiver Opt. plein écran"),
        @("EnableFullscreenOptimizations","Activer Opt. plein écran"),
        @("SetGPUPriorityGames","Priorité GPU Jeux"),
        @("DisableMouseAcceleration","Désactiver Accélération souris")
    )},
    @{ Title="6. MENU CONTEXTUEL (10)"; Items=@(
        @("AddContextMenuTerminal","Ajouter Terminal clic droit"),
        @("RemoveContextMenuTerminal","Retirer Terminal clic droit"),
        @("AddContextMenuNotepad","Ajouter Notepad clic droit"),
        @("RemoveContextMenuNotepad","Retirer Notepad clic droit"),
        @("EnableClassicContextMenu","Menu contextuel classique"),
        @("DisableClassicContextMenu","Menu contextuel moderne"),
        @("AddTakeOwnership","Ajouter Take Ownership"),
        @("RemoveTakeOwnership","Retirer Take Ownership"),
        @("AddOpenWithNotepad","Ajouter Ouvrir avec Notepad"),
        @("RemoveOpenWithNotepad","Retirer Ouvrir avec Notepad")
    )},
    @{ Title="7. APPS / DEBLOAT (20)"; Items=@(
        @("UninstallOneDrive","Désinstaller OneDrive"),
        @("InstallOneDrive","Réinstaller OneDrive"),
        @("UninstallXboxApps","Désinstaller Xbox Apps"),
        @("UninstallCortana","Désinstaller Cortana"),
        @("UninstallOneNote","Désinstaller OneNote"),
        @("UninstallSkype","Désinstaller Skype"),
        @("UninstallTeams","Désinstaller Teams"),
        @("UninstallSolitaire","Désinstaller Solitaire"),
        @("UninstallNews","Désinstaller News"),
        @("UninstallWeather","Désinstaller Météo"),
        @("UninstallMaps","Désinstaller Cartes"),
        @("UninstallPaint3D","Désinstaller Paint 3D"),
        @("UninstallMixedReality","Désinstaller Mixed Reality"),
        @("UninstallStickyNotes","Désinstaller Sticky Notes"),
        @("UninstallYourPhone","Désinstaller Your Phone"),
        @("UninstallGetHelp","Désinstaller Get Help"),
        @("UninstallFeedbackHub","Désinstaller Feedback Hub"),
        @("UninstallEdge","Désinstaller Edge"),
        @("UninstallBingWallpaper","Désinstaller Bing Wallpaper"),
        @("UninstallTikTok","Désinstaller TikTok")
    )},
    @{ Title="8. MAINTENANCE (15)"; Items=@(
        @("CreateCleanupTask","Créer Tâche nettoyage hebdo"),
        @("RemoveCleanupTask","Supprimer Tâche nettoyage"),
        @("CreateRestorePointTask","Créer Tâche point restauration"),
        @("DisableScheduledDefrag","Désactiver Défrag planifiée"),
        @("EnableScheduledDefrag","Activer Défrag planifiée"),
        @("DisableTelemetryTasks","Désactiver Tâches télémétrie"),
        @("CreateWSLInstallTask","Installer WSL Ubuntu"),
        @("ClearTempFiles","Vider Fichiers temporaires"),
        @("ClearWindowsUpdateCache","Vider Cache Windows Update"),
        @("ClearEventLogs","Vider Journaux d'événements"),
        @("OptimizeDrives","Optimiser Lecteurs"),
        @("DisableSuperfetch","Désactiver SysMain / Superfetch"),
        @("EnableSuperfetch","Activer SysMain / Superfetch"),
        @("DisableSysMain","Désactiver SysMain"),
        @("EnableSysMain","Activer SysMain")
    )}
)

# --- CREATION FENETRE ---
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="testProject1 - Windows 10 - 150 Fonctions" Height="700" Width="900" Background="#1E1E1E" Foreground="White" WindowStartupLocation="CenterScreen">
    <Grid Margin="12">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <TextBlock Text="testProject1 - Fine-Tune Windows 10" FontSize="22" FontWeight="Bold" Foreground="White"/>
        <TextBlock Grid.Row="1" Text="Cochez les fonctions a appliquer - 150 fonctions - Inspire de Sophia Script" Foreground="#AAAAAA" Margin="0,2,0,10"/>
        <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto">
            <StackPanel Name="MainPanel"/>
        </ScrollViewer>
        <StackPanel Grid.Row="3" Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,10,0,0">
            <Button Name="BtnSelectAll" Content="TOUT COCHER" Width="130" Height="38" Background="#333333" Foreground="White" Margin="0,0,8,0"/>
            <Button Name="BtnUnselectAll" Content="TOUT DECOCHER" Width="140" Height="38" Background="#333333" Foreground="White" Margin="0,0,8,0"/>
            <Button Name="BtnRun" Content="APPLIQUER" Width="160" Height="38" Background="#0078D4" Foreground="White" FontWeight="Bold"/>
        </StackPanel>
    </Grid>
</Window>
"@

$Reader = [System.Xml.XmlNodeReader]::new($XAML)
$Window = [Windows.Markup.XamlReader]::Load($Reader)
$MainPanel = $Window.FindName("MainPanel")
$AllCheckBoxes = @()

foreach ($Group in $Groups) {
    $GroupBox = New-Object System.Windows.Controls.GroupBox
    $GroupBox.Header = $Group.Title
    $GroupBox.Foreground = [System.Windows.Media.Brushes]::White
    $GroupBox.FontWeight = "Bold"
    $GroupBox.Margin = "0,0,0,10"
    $Stack = New-Object System.Windows.Controls.StackPanel
    $Stack.Margin = "5"
    foreach ($Item in $Group.Items) {
        $Cb = New-Object System.Windows.Controls.CheckBox
        $Cb.Content = $Item[1]
        $Cb.Tag = $Item[0]
        $Cb.Foreground = [System.Windows.Media.Brushes]::White
        $Cb.FontWeight = "Normal"
        $Cb.Margin = "0,1,0,1"
        # Preselection intelligente : on coche par defaut les Disable / Uninstall / Enable utiles
        if ($Item[0] -like "Disable*" -or $Item[0] -like "Uninstall*" -or $Item[0] -eq "EnableDarkTheme" -or $Item[0] -eq "ShowFileExtensions") { $Cb.IsChecked = $true }
        $Stack.Children.Add($Cb) | Out-Null
        $AllCheckBoxes += $Cb
    }
    $GroupBox.Content = $Stack
    $MainPanel.Children.Add($GroupBox) | Out-Null
}

$Window.FindName("BtnSelectAll").Add_Click({ foreach($c in $AllCheckBoxes){ $c.IsChecked = $true } })
$Window.FindName("BtnUnselectAll").Add_Click({ foreach($c in $AllCheckBoxes){ $c.IsChecked = $false } })

$Window.FindName("BtnRun").Add_Click({
    $Count = 0
    $Errors = @()
    foreach ($Cb in $AllCheckBoxes) {
        if ($Cb.IsChecked) {
            $Func = $Cb.Tag
            try {
                if (Get-Command $Func -ErrorAction SilentlyContinue) { Invoke-Expression $Func; $Count++ }
            } catch { $Errors += "$Func : $_" }
        }
    }
    [System.Windows.MessageBox]::Show("testProject1 termine !`n$Count fonctions appliquees.`nErreurs: $($Errors.Count)", "testProject1")
})

$Window.ShowDialog() | Out-Null
