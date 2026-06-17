# Timetravel  is no rocket science.

It can be done easily with an open source library called *libfaketime*.
When using *kTailor* as a manipulating kubernetes webhook in the background,
all it needs to start the timetravel is *labeling your deployment*.
So lets get started.

1. First, list the pods of the legacy application:
`kubectl get pods -l=app=marty`{{execute}}

2. Check the logfile which is written inside the container:
`kubectl logs deploy/marty-mcfly`{{execute}}

3. Open the applications web page in your browser: Click on the burger button to the top right
and choose "Traffic/Ports". You'll be directed to a page where you may choose between different ports.
Click on the grey button labeld "80".<br/>A new tab opens with three time displays. The top one shows
the time inside the container, to middle one the real time outside. As you can see, the Marty app
runs in the year 1985. Let's bring it back to the future.

4. Therefore we just label the Marty app with a references to the 2015 template (`local.timetravel-template-2015.yaml`):
`kubectl label --overwrite deployment marty-mcfly ktailor.dev/fit="local.timetravel-template-2015.yaml"`{{execute}}

5. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=marty`{{execute}}

6. Watch the time circuit displays in the other browser tab. As soon as the new pod gets ready, the
time in the upper row changes.

kTailor modified the deployment on the fly, and the libfaketime library makes
the container believe that it's in 2015 now.

