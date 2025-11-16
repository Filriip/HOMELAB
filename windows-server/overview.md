# 🪟 Windows Server — Vue d’ensemble

Cette section décrit la configuration Windows Server de mon homelab :
- Domaine Active Directory (`homelab.local`)
- Sous-domaine (`test.homelab.local`)
- MDT pour le déploiement d’images
- Veeam pour les sauvegardes

## Serveurs
| Nom | Rôle | OS | IP |
|------|------|----|----|
| SRV-DC | Contrôleur de domaine principal | Windows Server 2025 | 192.168.2.249 |
| SRV-DC2 | Sous-domaine | Windows Server 2025 | 192.168.2.247 |
| SRV-MDT | Déploiement MDT | Windows Server 2022 | 192.168.2.248 |
| SRV-VEEAM | Sauvegarde Veeam | Windows Server 2022 | 192.168.2.250 |
