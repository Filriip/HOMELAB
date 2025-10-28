# 📊 Supervision & Monitoring

Cette section présente la solution de supervision du homelab basée sur **Zabbix** et **Grafana**.  
L’objectif est de suivre en temps réel l’état des serveurs, services et conteneurs déployés.

---

## 🧠 Objectifs

- Surveiller la disponibilité des serveurs (Windows, Linux, Docker)
- Collecter des métriques (CPU, RAM, stockage, réseau)
- Visualiser les performances via des tableaux de bord interactifs

---

## 🧱 Architecture de supervision

| Composant | Rôle | Hébergement |
|------------|------|--------------|
| **Zabbix Server** | Collecte et stockage des métriques | VM dédiée sous Debian |
| **Zabbix Agent** | Envoi des données de monitoring depuis les hôtes | Tous les serveurs |
| **Grafana** | Visualisation et tableaux de bord dynamiques | Conteneur Docker |
| **Base de données (MySQL / PostgreSQL)** | Backend pour Zabbix | VM sous Debian|

---


