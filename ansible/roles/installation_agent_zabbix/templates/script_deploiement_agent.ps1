# Définir les variables
$msiPath = "C:\Users\Administrateur\Downloads\zabbix_agent2-7.4.1-windows-amd64-openssl.msi"
$zabbixServer = "192.168.2.251"
$zabbixServerActive = "192.168.2.251"
$hostMetadata = "windows"
$hostname = "$env:COMPUTERNAME"

# Téléchragement de l'agent zabbix
Invoke-WebRequest -uri https://cdn.zabbix.com/zabbix/binaries/stable/7.4/7.4.1/zabbix_agent2-7.4.1-windows-amd64-openssl.msi -OutFile "C:\Users\Administrateur\Downloads\zabbix_agent2-7.4.1-windows-amd64-openssl.msi"

# Vérifier si le fichier MSI existe
if (-Not (Test-Path $msiPath)) {
    Write-Host "Le fichier MSI n'a pas été trouvé à l'emplacement spécifié : $msiPath"
    exit
}

# Installer l'agent Zabbix
$arguments = @(
    "/i", $msiPath,
    "/qn",  # Mode silencieux
    "SERVER=$zabbixServer",
    "SERVERACTIVE=$zabbixServerActive",
    "HostMetadata=$hostMetadata",
    "Hostname=$hostname"
)

Start-Process msiexec.exe -ArgumentList $arguments -Wait -PassThru

# Vérifier si l'installation a réussi
$service = Get-Service -Name "Zabbix Agent" -ErrorAction SilentlyContinue
if ($null -eq $service) {
    Write-Host "L'installation de l'agent Zabbix a échoué."
} else {
    Write-Host "L'agent Zabbix a été installé avec succès."
}

# Mettre à jour le fichier de configuration zabbix_agentd.conf
$confFilePath = "C:\Program Files\Zabbix Agent\zabbix_agentd.conf"

# Ajouter ou mettre à jour les clés HostMetadata et Hostname dans le fichier de configuration
if (Test-Path $confFilePath) {
    (Get-Content $confFilePath) | ForEach-Object {
        if ($_ -match "^HostMetadata=") {
            $_ = "HostMetadata=$hostMetadata"
        }
        if ($_ -match "^Hostname=") {
            $_ = "Hostname=$hostname"
        }
        $_
    } | Set-Content $confFilePath
    Write-Host "Les paramètres HostMetadata et Hostname ont été mis à jour dans le fichier de configuration."
} else {
    Write-Host "Le fichier de configuration n'a pas été trouvé."
}
