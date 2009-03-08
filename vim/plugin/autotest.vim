function! AutotestBuffer()
python << EOF
from vim import *

command(":botright new")

autotest = None
for b in buffers:
  if b.name == "log/autotest.log":
    autotest = b 

if autotest == None:
  command(":edit log/autotest.log")
  command(":map r :edit<CR>G")
else:
  command(":buffer %s" % autotest.name)
  command(":checktime")

EOF
endfunction
command! Autotest :call AutotestBuffer()
