# Step 2: Local Templates (Time Travel)

Now we use a **local** template stored in the same namespace as the application (`default`).

1. The timetravel app is already installed. It writes the current date and time to its stdout. Lets check how late it is now.
`kubectl logs deploy/timetravel-app | tail -n 1`{{execute}}

2. This is the timetravel template that moves the pod 222 days into the future. It sets two variables, adds an initContainer and mounts a shared volume:
`cat timetravel-template.yaml`{{execute}}

3. Now deploy the local template:
`kubectl apply -f /root/timetravel-template.yaml`{{execute}}

4. Label the app with the kTailor trigger:
`kubectl label deploy/timetravel-app ktailor.dev/fit="local.lft-plus222d" `{{execute}}

5. A new pod gets started which takes some time because the image for the initContainer needs to be pulled. Then the old pod terminates:
`kubectl get pods -l=app=timetravel`{{execute}}

6. Finally, verify the mutation in the logs - the container thinks it's in the future:
`kubectl logs deploy/timetravel-app | tail -n 1`{{execute}}

7. kTailor successfully moved the container "into the future".
