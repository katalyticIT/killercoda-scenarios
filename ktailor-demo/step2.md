# Step 2: Local Templates (Time Travel)

Now we use a **local** template stored in the same namespace as the application (`default`).

1. The timetravel app is already installed. Lets check how late it is now.
`kubectl exec deploy/timetravel-app -- date`{{execute}}

2. This is the timetravel template that moves the pod 222 days into the future. It sets two variables, adds an initContainer and mounts a shared volume:
`cat timetravel-template.yaml`{{execute}}

3. Now deploy the local template:
`kubectl apply -f /root/timetravel-template.yaml`{{execute}}

4. Label the app with the kTailor trigger:
`kubectl label --overwrite deploy/timetravel-app ktailor.dev/fit="local.lft-plus222d" `{{execute}}

5. A new pod gets started which takes some time because the image for the initContainer needs to be pulled. Once the new pod is running, the old one terminates:
`kubectl get pods -l=app=timetravel`{{execute}}

6. *Wait until the new pod is running.* Then verify the mutation - this container thinks it's in the future:
`kubectl exec deploy/timetravel-app -- date`{{execute}}

7. kTailor successfully moved the container "into the future". You may also check the logs; it prints the date every two seconds.
