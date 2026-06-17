# The engine is running. Let's go.

4. Now we just label the Marty app with a references to the 2015 template:
`kubectl label --overwrite deployment marty-mcfly ktailor.dev/fit="local.timetravel-template-2015"`{{execute}}

5. A new pod gets installed, the old one terminates:
`kubectl get pods -l=app=marty`{{execute}}

6. Watch the time circuit displays in the other browser tab. As soon as the new pod gets ready, the
time in the upper row changes to 2015.

