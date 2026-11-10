###### README.md >> markdown 
# ⚡ testProject1

> **Optimisation et personnalisation avancée de Windows 10 via PowerShell.**

[![Platform](https://img.shields.io/badge/OS-Windows%2010-success?logo=windows)](https://microsoft.com)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-success?logo=powershell)](https://github.com/PowerShell/PowerShell)
[![License](https://img.shields.io/badge/license-MIT-success.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)](#)

---

## 📌 Présentation

**testProject1** est une suite de fonctions PowerShell conçue pour ajuster, optimiser et épurer Windows 10. Il permet d'automatiser la configuration du système, de désactiver la télémétrie superflue et d'améliorer les performances globales via des scripts modulaires ou un menu interactif.

---

## ⚠️ Avertissement (Recommandé)

> [!WARNING]
> La modification de configurations système et du registre Windows comporte des risques. 
> Il est **fortement conseillé** de créer un **Point de Restauration Système** avant toute exécution :
> ```powershell
> Checkpoint-Computer -Description "Avant testProject1" -RestorePointType "MODIFY_SETTINGS"
> ```

---

## ✨ Fonctionnalités

- 🚀 **Optimisation des performances :** Désactivation de services superflus et d'effets visuels énergivores.
- 🔒 **Vie privée & Télémétrie :** Réduction de la collecte de données et du pistage Windows.
- 🧹 **Nettoyage (Debloat) :** Suppression d'applications préinstallées (bloatware) inutiles.
- 🖥️ **Interface au choix :** Mode script direct ou mode interactif avec menu (`-Wrapper`).

---

## ⚙️ Prérequis

- **Système d'exploitation :** Windows 10 (Éditions Home, Pro ou Enterprise)
- **Environnement :** PowerShell 5.1 ou version ultérieure
- **Privilèges :** Exécution en tant qu'**Administrateur** obligatoire

---

## 🚀 Installation & Utilisation

### 1. Ouvrir PowerShell en Administrateur
Faites un clic droit sur le menu **Démarrer** ➔ **Windows PowerShell (administrateur)** (ou Terminal).

### 2. Récupérer le projet
```powershell
# Cloner le dépôt
git clone https://github.com/teremuhamblin/testProject1.git
cd testProject1
```

### 3. Exécution
Autorisez temporairement l'exécution du script pour la session courante, puis lancez le script selon votre besoin :
Powershell
###### Autoriser les scripts dans la session actuelle
Set-ExecutionPolicy Bypass -Scope Process -Force

###### Exécution standard (mode direct / automatique)
.\testProject1.ps1

###### OU Exécution avec le menu interactif (Wrapper)
.\testProject1.ps1 -Wrapper

### 🎛️ Paramètres disponibles
- Paramètre, Type, Description
(aucun)
-	Exécute les ajustements standard définis par défaut.
- Wrapper	Switch	Lance une interface textuelle interactive permettant de choisir les modules à la carte.

📁 Structure du projet
```text
VOIR Docs/Structure.md
```

### 🤝 Contribution
- Les contributions, signalements de bogues et propositions d'améliorations sont les bienvenus !
- Forkez le projet
   - Créez une branche (*git checkout -b feature/nouvelle-fonction*)
   - Committez vos modifications (git commit -m 'feat: ajout tweak XYZ')
   - Poussez votre branche (git push origin feature/nouvelle-fonction)
Ouvrez une Pull Request

### 📄 Licence
Ce projet est sous licence MIT.

### 👤 Auteur
>> Teremu Hamblin - @teremuhamblin

### Ce qui a été amélioré :
1. **Sécurité ajoutée :** Un encadré d'avertissement invitant à créer un point de restauration (crucial pour tout script de tweak Windows).
2. **Badges GitHub :** Ajout de badges Windows 10, PowerShell, et statut.
3. **Clarification de l'argument `-Wrapper` :** Présenté comme une interface/menu interactif.
4. **Précision des prérequis :** Mention indispensable de lancer la console en mode **Administrateur**.
5. **Tableau des paramètres :** Permet de documenter clairement les options de ligne de commande.
