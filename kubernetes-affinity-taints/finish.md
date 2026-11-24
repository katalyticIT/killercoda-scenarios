# Übung abgeschlossen!

Du hast die erweiterten Scheduling-Konzepte in Kubernetes erfolgreich angewendet.

## Zusammenfassung im Vergleich zu `nodeSelector`

| Mechanismus | Wirkung | Typischer Einsatzfall |
|---|---|---|
| **`nodeSelector`** | Einfache `key=value`-Prüfung (harte Bedingung) | Schnelle Zuweisung einzelner Labels |
| **`requiredDuringScheduling...`** | Komplexe Logik (`In`, `NotIn`, `Exists`), harte Bedingung | Mehrere zulässige Zonen oder Hardware-Typen |
| **`preferredDuringScheduling...`** | Gewichtete Wunsch-Regel (weiche Bedingung) | Bevorzugte Platzierung mit automatischem Fallback |
| **Taints & Tolerations** | Node weist unberechtigte Pods ab | Dedizierte Nodes (z. B. GPU, Lizenz- oder Compliance-Nodes) |