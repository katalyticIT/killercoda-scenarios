#!/bin/bash
{
  set +x
  set +v
  clear
  echo -e "\n✨ Starting the DeLorean ... Please wait for the 'Cluster is ready!' message.\n"

  echo -n "Installing nginx proxy for accessing the app with your browser ..."
  while [ ! -f /root/.nginx_ready ]; do
    sleep 2
    echo -n "."
  done
  echo " done."


  echo -n "Installing the certificate manager ..."
  while [ ! -f /root/.certmanager_ready ]; do
    sleep 2
    echo -n "."
  done
  echo " done."

  echo -n "Installing the kTailor webhook ..."
  while [ ! -f /root/.ktailor_ready ]; do
    sleep 2
    echo -n "."
  done
  echo " done."

  echo -n "Installing the apps ..."
  while [ ! -f /root/.apps_ready ]; do
    sleep 2
    echo -n "."
  done
  echo " done."

  if [ -f /root/error.txt ]; then
    echo -e "\nWe're sorry, something went wrong in the setup:"
    cat /root/error.txt
    echo ""
  else
    echo -e "\n✅ Cluster is ready! Click 'Start' on the right.\n"
  fi

  # add some aliases
  . /root/.bashrc

} 2>/dev/null


