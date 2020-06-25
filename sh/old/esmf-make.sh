#!/usr/bin/env bash
#set -Eeuxo pipefail

cd "${ESMF_DIR}" || exit

echo "ESMF make..."
OUTFILE="esmf-make.out"
# shellcheck disable=SC2046
make -j $(nproc) > ${OUTFILE} 2>&1 & PID=${!}
sleep 5
while kill -0 $PID 2> /dev/null; do
  tail -n 2 ${OUTFILE}
  echo "..."
  sleep 1m
done

if wait $PID
then
  tail -n 2 ${OUTFILE}
  echo "ESMF make SUCCESS" && echo ""
else
  tail -n 50 ${OUTFILE}
  echo "ESMF make FAILURE" && echo ""
  exit 1
fi

# -----------------------------------------------------------------------------

echo "ESMF make install..."
if make install > esmf-make-install.out 2>&1
then
  MSG="ESMF make install SUCCESS"
else
  MSG="ESMF make install FAILURE"
fi
tail esmf-make-install.out
echo "${MSG}"
