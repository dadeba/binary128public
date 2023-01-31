#!/bin/bash
fpga_crossgen --source ocl addmul.xml --target ocl -o addmul.aoco
fpga_libtool --target ocl --create addmul.aoclib addmul.aoco
