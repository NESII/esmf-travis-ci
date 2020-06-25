#!/usr/bin/env bash
#set -Eeuxo pipefail

function run_esmf_make_target
{
cd "${ESMF_DIR}" || exit
CMD=${1}
echo "========================================================================"
echo "ESMF make ${CMD}"
echo "========================================================================"
# shellcheck disable=SC2046
make "${CMD}" > "esmf-make-${CMD}.out" 2>&1 & PID=${!}
sleep 5
while kill -0 ${PID} 2> /dev/null; do
  tail -n 2 "esmf-make-${CMD}".out
  echo "..."
  sleep 1m
done

echo "========================================================================"
if wait ${PID}
then
  FLAG="SUCCESS"
else
  FLAG="FAILURE"
  exit 1
fi
echo "ESMF make ${CMD} ${FLAG}"
echo "Log Output (tail):"
tail -n 100 "esmf-make-${CMD}".out
echo "========================================================================"
}

run_esmf_make_target "build_unit_tests" || exit 1
run_esmf_make_target "build_system_tests" || exit 1
run_esmf_make_target "build_examples" || exit 1
