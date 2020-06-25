#!/usr/bin/env bash
#set -Eeuxo pipefail

cd "${ESMPY_DIR}" || exit

if python setup.py build --ESMFMKFILE="${ESMFMKFILE}" > esmpy-build.out 2>&1
then
  echo "ESMPy build SUCCESS" && echo ""
else
  echo "ESMPy build FAILURE" && echo ""
  tail -n 50 esmpy-build.out
  exit 1
fi

if python setup.py test > esmpy-test.out 2>&1
then
  echo "ESMPy test SUCCESS" && echo ""
else
  echo "ESMPy test FAILURE" && echo ""
  tail -n 50 esmpy-test.out
  exit 1
fi

python -c "import ESMF" || exit
