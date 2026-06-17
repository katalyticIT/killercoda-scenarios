# Inside the magic

7. Finally, have a look at the kTailor template which has been used to shift the container
through time; it's simply a configMap with some yaml lines as you usually use it
inside a deployment:
`cat timetravel-template-2015.yaml`{{execute}}
It's as easy as that.

8. And if you want to send it back to the past again, just label the app with the other template:
`kubectl label --overwrite deployment marty-mcfly ktailor.dev/fit="local.timetravel-template-1985"`{{execute}}

