#!/bin/bash
ntpq -c "host 127.0.0.1" -pn

result=$?
if [ $result -eq 0 ]; then
  echo "chrony seems to work"
else
  echo "Something went wrong, please make sure chrony runs on this machine."
  echo "check the output above for any hints"
fi
exit $result
