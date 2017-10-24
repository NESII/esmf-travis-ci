import subprocess

# Serial tests.
cmd1 = ['nosetests', '-vs', '-a', '!slow,!parallel,!data', 'ESMF']

# Parallel tests.
cmd2 = ['mpirun', '-n', '4', 'nosetests', '-vs', '-a', '!slow,!serial,!data', 'ESMF']

# Slow tests.
# cmd3 = ['nosetests', '-vs', '-a', 'slow,!data', 'ESMF']

for cmd in [cmd1, cmd2]:
    subprocess.check_call(cmd)
