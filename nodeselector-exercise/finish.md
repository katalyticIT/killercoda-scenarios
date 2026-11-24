# Übung abgeschlossen!

Du hast das Prinzip von **`nodeSelector`** in Kubernetes erfolgreich erarbeitet und praktisch getestet.

## Wichtigste Erkenntnisse

- **Node-Labels (`kubectl label nodes ...`):** Metadaten als Key-Value-Paare zur logischen Gruppierung von Cluster-Nodes.
- **Gezieltes Scheduling (`spec.nodeSelector`):** Zwingt den `kube-scheduler`, einen Pod nur auf Nodes zu starten, die exakt die angegebenen Labels besitzen.
- **Harte Bedingung:** Existiert kein passender Node, verbleibt der Pod dauerhaft im Status **`Pending`** (`FailedScheduling`), anstatt auf einen anderen Node auszuweichen.
- **Downward API (`spec.nodeName`):** Ermöglicht es einem Container, zur Laufzeit den Namen seines Host-Nodes auszulesen.
