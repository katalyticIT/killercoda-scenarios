# Step 1: Central Mutation
`kubectl apply -f /root/demo-template.yaml`{{execute}}
`kubectl apply -f /root/demo-app.yaml`{{execute}}
`kubectl exec deploy/demo-app -- env | grep KTAILORTEST`{{execute}}
