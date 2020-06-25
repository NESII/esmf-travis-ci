#!/usr/bin/env bash
#set -Eeuxo pipefail

cd "${ESMF_DIR}" || exit

CMD="all_tests"
echo "ESMF make ${CMD}"
# shellcheck disable=SC2046
make ${CMD} > esmf-make-${CMD}.out 2>&1 & PID=${!}
sleep 5
while kill -0 $PID 2> /dev/null; do
  tail -n 2 esmf-make-${CMD}.out
  echo "..."
  sleep 1m
done

if wait $PID
then
  echo "ESMF make ${CMD} SUCCESS"
else
  echo "ESMF make ${CMD} FAILURE"
  exit 1
fi

tail -n 100 esmf-make-${CMD}.out
echo ""
