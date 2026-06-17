# Timetravel  is no rocket science.

It can be done easily with an open source library called *libfaketime*.
When using *kTailor* as a manipulating kubernetes webhook in the background,
all it needs to start the timetravel is *labeling your deployment*.
So lets get started.

1. First, list the pods of the legacy application:
`kubectl get pods -l=app=marty`{{execute}}

2. Open the applications web page in your browser: Click on the burger button
to the top right and choose "Traffic/Ports". You'll be directed to a page where
you may choose between different ports. Click on the grey button labeled "80".

3. A new tab opens with three time displays. The top one shows the time inside
the container, the middle one shows the real time outside. As you can see, the
Marty app runs in the year 1985. Let's bring it back to the future.

