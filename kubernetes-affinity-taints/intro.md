# Erweitertes Scheduling: Node Affinity, Taints & Tolerations

Willkommen zu dieser geführten Aufbauübung! Während `nodeSelector` nur exakte Übereinstimmungen (`key=value`) erlaubt und bei fehlendem Match den Pod sofort blockiert, bietet Kubernetes deutlich flexiblere Mechanismen:

- **Node Affinity:** Ermöglicht ausdrucksstarke Regeln (z. B. `In`, `NotIn`, `Exists`) sowie eine Unterscheidung zwischen **zwingenden** (*Required*) und **bevorzugten** (*Preferred*) Vorgaben.
- **Taints & Tolerations:** Kehren das Prinzip um – ein **Node** weist Pods aktiv ab (*Taint*), sofern diese keine passende Ausnahmegenehmigung (*Toleration*) mitbringen.

## Ablauf der Übung

1. **Nodes vorbereiten:** Du versiehst `controlplane` und `node01` mit den Labels `location=room-green` bzw. `location=room-blue` und belegst `node01` mit einem **Taint**.
2. **Hard Node Affinity (`Required`):** Du startest `pod-required.yaml` mit einer Auswahl erlaubter Ziel-Räume (`In`).
3. **Soft Node Affinity (`Preferred`):** Du startest `pod-preferred.yaml` mit einer Wunsch-Präferenz für `room-red` und beobachtest den automatischen Fallback.
4. **Geschützten Node nutzen (`Toleration`):** Du startest `pod-blue-vip.yaml` mit einer passenden Toleration auf dem gesperrten Node `node01`.
5. **Aufräumen:** Du löschst alle Pods und entfernst den Taint wieder.

Klicke auf **START**, um die Umgebung zu starten.