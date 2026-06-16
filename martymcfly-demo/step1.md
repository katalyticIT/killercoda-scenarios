# Moving containers through time

Timetravel for containers isn't rocket science. It can be done easily with an
open source library called *libfaketime*. And using *kTailor* as a manipulating
kubernetes webhook in the background, all it needs to start the timetravel is
labeling your deployment. So lets get started.


1. First, list the pods of the legacy application:
`kubectl get pods -l=app=marty-mcfly`{{execute}}

2. Check the logfile which is written inside the container:
`kubectl logs deploy/marty-mcfly`{{execute}}

3. Now lets have a look at the already deployed template for the kTailor webhook. According to this, kTailor will insert liblogtap into the container and log output will be redirected to its stdout:
`cat logredirect-template.yaml`{{execute}}

4. Now we just label the Marty app with a references to the 2015 template (`local.timetravel-template-2015.yaml`):
`kubectl label --overwrite deployment marty-mcfly ktailor.dev/fit="local.timetravel-template-2015.yaml"`{{execute}}

5. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=marty-mcfly`{{execute}}

6. Once the new pod is running, check the logfile inside the container - it now stays empty:
`kubectl logs deploy/marty-mcfly`{{execute}}

ktailor modified the deployment on the fly, and the libfaketime library makes
the container believe that it's in 2015 now.

