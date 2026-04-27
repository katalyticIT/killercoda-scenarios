#!/bin/bash
{
  set +x
  set +v
  #clear
  echo -e "\n✨ Welcome to the kTailor Demo!\n"
  echo    "Shortcuts 'kc' and 'ns' have been added to your shell."
  echo -n "Booting kTailor..."

  while [ ! -f /root/.background_ready ]; do
    sleep 2
    echo -n "."
  done

  echo -e "\n✅ Ready! Click 'Start' on the right.\n"

} 2>/dev/null
