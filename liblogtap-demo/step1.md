# Redirecting fixed logfile

Sometimes a legacy app "needs" to be moved into the container world and of course one
would ask for time to rewrite it according to 12 factros, but, well, management ...

This may lead to a logfile inside the container, eating disk space,
and no log output on the containers stdout stream, which means there's
no log to be searchable in your ELK stack (or similar). :-(

Liblogtap helps you to cure this _without having to manipulate the
legacy app or its docker image._

1. First, list the pods of the legacy application:
`kubectl get pods -l=app=logtapdemo`{{execute}}

2. Check the logfile which is written inside the container:
`kubectl exec deploy/logtapdemo -- tail /tmp/demo.log`{{execute}}

3. Now lets have a look at the already deployed template for the kTailor webhook. According to this, kTailor will insert liblogtap into the container and log output will be redirected to its stdout:
`cat logredirect-template.yaml`{{execute}}

4. Now we just label the app with a references to the template (`central.logredirect`):
`kubectl label --overwrite deployment logtapdemo ktailor.dev/fit="central.logredirect"`{{execute}}

5. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=logtapdemo`{{execute}}

6. Once the new pod is running, check the logfile inside the container - it now stays empty:
`kubectl exec deploy/logtapdemo -- tail /tmp/demo.log`{{execute}}

7. Instead the log output appears on the stdout stream of the container - the way it should be:
`kubectl logs deploy/logtapdemo`{{execute}}

ktailor modified the deployment on the fly, injecting the liblogtap library and some environment
variables into the pod.

As result, the log output is going to the pods stdout stream, being accessible for log aggregators,
while the LLT_SUPPRESS_TAP_FILE variable keeps the filesystem inside the container nice and clean.

