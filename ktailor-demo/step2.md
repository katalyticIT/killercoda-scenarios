# Step 2: Local Templates (Time Travel)

Now we use a **local** template stored in the same namespace as the application (`default`).

1. Create the local template:
`kubectl apply -f /root/timetravel-template.yaml`{{execute}}

2. Deploy the app that references it (`local.lft-plus222d`):
`kubectl apply -f /root/timetravel-app.yaml`{{execute}}

3. Verify the mutation (InitContainer and Env Vars):
`kubectl get pods`{{execute}}
`kubectl exec deploy/timetravel-app -- date`{{execute}}
