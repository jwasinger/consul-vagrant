#! /usr/bin/python

import sys
import subprocess, pdb

sshCmd = '''
$(vagrant ssh-config {0} | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {{print " -o "{0}"="$2}}') localhost '{1}'
'''

pdb.set_trace()

subprocess.call([sshCmd.format("n1", "screen -r top")])
