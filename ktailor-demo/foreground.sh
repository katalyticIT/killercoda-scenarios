#!/bin/bash
{
  set +x
  set +v
  clear
  echo "✨ Welcome to the kTailor Demo!"
  echo "Shortcuts 'kc' and 'ns' have been added to your shell."
  echo -n "Booting kTailor... "

  while [ ! -f /root/.background_ready ]; do
    sleep 2
    echo -n "."
  done

  echo ""
  echo "✅ Ready! Click 'Start' on the right."
} 2>/dev/null
