#! /usr/bin/env python2.7
# -*- mode: python; coding: utf-8; -*-
#
#  Codezero -- Virtualization microkernel for embedded systems.
#
#  Copyright © 2009  B Labs Ltd
#
import os, sys
from os.path import join

PROJRELROOT = "../.."
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), PROJRELROOT)))

from scripts.config.projpaths import *
from scripts.config.configuration import *

# Mapping between system configuration and qemu flags
#           Platform         CPU           qemu "-M" flag          qemu "-cpu" flag
map_list = (['EB',          'ARM1136',      'realview-eb',          'arm1136'],
            ['EB',          'ARM11MPCORE',  'realview-eb-mpcore',   'arm11mpcore'],
            ['EB',          'CORTEXA8',     'realview-eb',          'cortex-a8'],
            ['EB',          'CORTEXA9',     'realview-pbx-a9',      'cortex-a9'],
            ['PB926',       'ARM926',       'versatilepb',          'arm926'],
            ['BEAGLE',      'CORTEXA8',     'beagle',               'cortex-a8'],
            ['PBA9',        'CORTEXA9',     'realview-vx-a9',       'cortex-a9'],       ['AM1808',       'ARM926',        'versatilepb',       'arm926'    ])

data_up = \
'''
cd build
qemu-system-arm -s -S -kernel final.elf -M %s -cpu %s %s &
arm-none-insight ; pkill qemu-system-arm
cd ..
'''

data_smp = \
'''
cd build
qemu-system-arm -s -S -kernel final.elf -smp %d -M %s -cpu %s %s &
arm-none-insight ; pkill qemu-system-arm
cd ..
'''

# File to be generated with qemu commandline
qemu_cmd_file = join(TOOLSDIR, 'run-qemu-insight')

def build_qemu_cmdline_script():
    # Get system selected platform and cpu
    config = configuration_retrieve()
    cpu = config.cpu.upper()
    platform = config.platform.upper()
    smp = config.smp
    ncpu = config.ncpu

    # Find appropriate flags
    for platform_type, cpu_type, m_flag, cpu_flag in map_list:
        if platform_type == platform and cpu_type == cpu:
            mflag = m_flag
            cpuflag = cpu_flag
            break

    if not mflag or not cpuflag:
        print 'Qemu flags not found'
        sys.exit(1)

    # Special case for EB+A9(non-smp)
    if platform == 'EB' and cpu == 'CORTEXA9' and smp == False:
        mflag = 'realview-eb'

    # Check if we CLCD is selected, otherwise use -nographic
    clcd = None
    for sym0, sym1 in config.all:
	    parts = sym0.split("_", )
	    if len(parts) >= 5 and parts[3] == 'DEVICE' and \
	       parts[4][:len("CLCD")] == "CLCD":
			clcd = '-serial stdio'
    if not clcd:
	    clcd = '-nographic'

    # Write run-qemu-insight file
    with open(qemu_cmd_file, 'w+') as f:
        if smp == False:
            f.write(data_up % (mflag, cpuflag, clcd))
        else:
            f.write(data_smp % (ncpu, mflag, cpuflag, clcd))

    os.system("chmod +x " + qemu_cmd_file)
    return None

def clean_qemu_cmdline_script():
    os.system('rm -f ' + qemu_cmd_file)
    return None

if __name__ == "__main__":
    build_qemu_cmdline_script()
