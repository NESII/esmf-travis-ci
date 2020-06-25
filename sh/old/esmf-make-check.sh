#!/usr/bin/env bash
#set -Eeuxo pipefail

cd "${ESMF_DIR}" || exit

# shellcheck disable=SC2046
make check > esmf-make-check.out 2>&1 & PID=${!}
sleep 5
while kill -0 $PID 2> /dev/null; do
  tail -n 2 esmf-make-check.out
  echo "..."
  sleep 1m
done

tail -n 50 esmf-make-check.out

if wait $PID
then
  echo ""
  echo "ESMF make check SUCCESS" && echo ""
else
  echo "ESMF make check FAILURE" && echo ""
  exit 1
fi
