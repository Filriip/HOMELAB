# ☁️ Virtualisation — Vue d’ensemble

Cette section décrit la couche de virtualisation du homelab utilisée pour héberger les serveurs Windows et Linux.

## 🧩 Objectifs
- Centraliser la gestion des machines virtuelles
- Isoler les environnements via VLAN
- Tester la haute disponibilité (si possible)
- Gérer les sauvegardes via Veeam

## 🖥️ Hyperviseurs
| Hôte | Logiciel | Ressources | 
|------|-----------|-------------|
| ESXi-1 | VMware ESXi 7.0 | 32 Go RAM / 8 vCPU | 
| ESXi-2 | VMware ESXi 8.0 | 64 Go RAM / 12 vCPU | 


Les 2 hotes ESXi dispose de deux supports physiques :

| Type | Capacité | Utilisation | Format | Monté comme |
|------|-----------|--------------|---------|-------------|
| SSD SATA | 240 Go | Installation d’ESXi et datastore principal | VMFS6 | `datastore1` |
| NVMe PCIe | 2 To | Hébergement des machines virtuelles | VMFS6 | `datastore_nvme`

