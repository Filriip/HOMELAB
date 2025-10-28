# 🧰 Scripts Zabbix personnalisés

Ces scripts sont utilisés par les `UserParameter` de Zabbix pour collecter des métriques spécifiques non couvertes par l’agent par défaut.

| Script | Description | Exemple d’utilisation |
|--------|--------------|-----------------------|
| `check_rsync.sh` | permet de surveiller l'etat d'une tache rsync | `UserParameter=nvme.temp,/usr/local/bin/check_rsync.sh` |

