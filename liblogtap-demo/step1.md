# Redirecting fixed logfile

Sometimes a legacy app "needs" to be moved into the container world,
leading to a logfile inside the container and no log output on the containers
stdout stream and thus no log to be searchable in your ELK stack (or similar).

1. Check the installed app and view the legacy apps logfile inside the container:
`kubectl exec deploy/logtapdemo -- head /tmp/demo.log`{{execute}}

2. Lets have a look at the already deployed template for the kTailor webhook. According to this, kTailor will insert liblogtap into the container and log output will be redirected to its stdout:
`cat logredirect-template.yaml`{{execute}}

3. Now we just label the app with a references to the template (`central.logredirect`):
`kubectl label --overwrite deployment logtapdemo ktailor.dev/fit="central.logredirect"`{{execute}}

4. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=logtapdemo`{{execute}}

5. Once the new pod is running, check the logfile inside the container - it now stays empty:
`kubectl exec deploy/logtapdemo -- cat /tmp/demo.log`{{execute}}

6. Instead the log output appears on the stdout stream of the container - the way it should be:
`kubectl logs deploy/logtapdemo`{{execute}}

7. ktailor modified the deployment on the fly, inserting the liblogtap plibrary and some environment variables to cotrol its bevavoiur.

