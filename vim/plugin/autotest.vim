function! AutotestBuffer()
python << EOF
from vim import *
from threading import *
import time

command(":botright new")
command(":edit log/autotest.log")

autotest = None
for b in buffers:
  if b.name == "log/autotest.log":
    autotest = b 

def checkAutotest():
  while True:
    if current.buffer != autotest:
      pass
    else:
      current.buffer.append("asdf")
      time.sleep(1)

thread = Thread(target=checkAutotest)
thread.start()

EOF
endfunction
command! Autotest :call AutotestBuffer()
