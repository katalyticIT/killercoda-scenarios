# Step 1: Central Templates

In this step, we use a **central** template managed in the `ktailor` namespace.

1. Create the central template:
`kubectl apply -f /root/demo-template.yaml`{{execute}}

2. Deploy the app that references it (`central.ktailor-test`):
`kubectl apply -f /root/demo-app.yaml`{{execute}}

3. Check the result:
`kubectl exec deploy/demo-app -- env | grep KTAILORTEST`{{execute}}
