# Step 1: Central Templates

In this step, we use a **central** template managed in the `ktailor` namespace.

1. Check the installed app and the env variable that's set inside the container:
`kubectl exec deploy/insert-env-app -- env | grep KTAILORTEST`{{execute}}

2. Lets have a look at the demo template. It manipulates one env var and consists of just a handful of lines:
`cat insert-env-template.yaml`{{execute}}

3. Let's deploy it as a central template:
`kubectl apply -f /root/insert-env-template.yaml`{{execute}}

3. Now we label the app with a references to the template (`central.ktailor-test`):
`kubectl label deployment insert-env-app ktailor.dev/fit="central.ktailor-test"`{{execute}}

3. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=insert-env-app`{{execute}}

4. Once the new pod is running, check the output:
`kubectl exec deploy/insert-env-app -- env | grep KTAILORTEST`{{execute}}

5. ktailor modified the deployment on the fly, oberwriting the environment variable.

