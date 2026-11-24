## Schritt 5: Alle Pods löschen

Lösche abschließend alle drei erstellten Pods wieder aus dem Cluster:

```bash
kubectl delete pod pod-green pod-blue pod-red
```{{exec}}

Kontrolliere, dass keine Pods mehr im `default`-Namespace vorhanden sind:

```bash
kubectl get pods
```{{exec}}
