# Step 2: Advanced Sidecars & Volumes (Time Travel)

kTailor can do much more than just inject variables. In this step, we will use a template that manipulates the system time for a specific container (`libfaketime`) without changing the actual node time.

This requires an `InitContainer`, a shared `emptyDir` volume, and multiple environment variables.

Take a look at this powerful template:
`cat /root/timetravel-template.yaml`{{execute}}

Apply it to the cluster:
`kubectl apply -f /root/timetravel-template.yaml`{{execute}}

Now check out the target Deployment. It's just a simple busybox pod, but it has the `ktailor.dev/fit: "central.lft-plus222d"` label:
`cat /root/timetravel-app.yaml`{{execute}}

Deploy it:
`kubectl apply -f /root/timetravel-app.yaml`{{execute}}

Check the Pods. You will notice that an InitContainer was injected and executed before the main container started:
`kubectl get pods`{{execute}}

Let's check the volume mounts of the running container to see the injected shared volume:
`kubectl describe pod -l app=timetravel | grep -A 2 Mounts`{{execute}}
