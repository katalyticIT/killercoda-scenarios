#!/bin/bash
{
  set +x
  set +v
  clear
  echo -e "\n✨ Welcome to the kTailor Demo! \n"
  echo -n "Installing the kTailor webhook ..."

  while [ ! -f /root/.background_ready ]; do
    sleep 2
    echo -n "."
  done

  if [ -f /root/error.txt ]; then
    echo -e "\nWe're sorry, something went wrong in the setup:"
    cat /root/error.txt
    echo ""
  else
    echo -e "\n✅ Ready! Click 'Start' on the right.\n"
  fi

} 2>/dev/null
