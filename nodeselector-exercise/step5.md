## Aufgabe 5: Aufräumen

Lösche abschließend alle drei erstellten Pods (`pod-green`, `pod-blue` und `pod-red`) aus dem Cluster und überprüfe, dass keine Pods mehr im `default`-Namespace laufen.

<details>
<summary>Hilfe &amp; Musterlösung anzeigen</summary>

Alle drei Pods löschen:
```bash
kubectl delete pod pod-green pod-blue pod-red
```{{exec}}

Kontrollieren, dass alle Pods entfernt wurden:
```bash
kubectl get pods
```{{exec}}

</details>
