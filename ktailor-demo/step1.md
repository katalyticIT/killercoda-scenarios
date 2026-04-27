# Step 1: Injecting Variables

Let's apply a simple template that injects an environment variable into a container. We have prepared the file `/root/demo-template.yaml` for you.

Take a look at the template:
`cat /root/demo-template.yaml`{{execute}}

Apply the template (a ConfigMap) to the cluster:
`kubectl apply -f /root/demo-template.yaml`{{execute}}

Now, let's look at a simple Nginx application. Notice the `ktailor.dev/fit` label that triggers our webhook:
`cat /root/demo-app.yaml`{{execute}}

Deploy the app:
`kubectl apply -f /root/demo-app.yaml`{{execute}}

**The Moment of Truth!**
Although the Nginx manifest contained no environment variables, kTailor injected them during startup. Let's check the Pod:

`kubectl get pods`{{execute}}

*(Wait a second for the Pod to be running, then execute the following command to read the environment variables):*

`kubectl exec deploy/demo-app -- env | grep KTAILORTEST`{{execute}}

If you see `Hello from Killercoda magic!`, kTailor successfully mutated the Deployment!
