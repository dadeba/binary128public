# FP add and mul units in binary128 format

## (1,15,112) written in VHDL.

add_ftp2018.vhd : Add unit (fp_add_128_112_15_5). Latency is 5 cycles.

mul_fpt2018.vhd : Mul unit (fp_mul_128_112_15_6). Latency is 6 cycles. The multiplier is truncated as decsibed in our paper.

utils.vhd : Varius IP components used in the Add and Mul units. 

addmul.xml : The XML definition of the two modules for fpga_crossgen/fpga_libtool.

genlib.sh : Script to generate the library for aoc

Reference: Nakasato, Daisaka & Ishikawa, FTP2018, https://ieeexplore.ieee.org/document/8742336
