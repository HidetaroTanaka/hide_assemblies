import sys

i = 0
for line in sys.stdin:
    print('  mem.write("h{:08x}".U, "h{}".U)'.format(i*4, line.rstrip()))
    i = i + 1