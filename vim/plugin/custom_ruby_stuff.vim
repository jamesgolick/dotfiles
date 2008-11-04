function! RubyTestName()
python << EOF
from vim import *
import re

test_name_exp = re.compile('\s+should "(.+?)" do')
for i in range(current.window.cursor[0] - 1, current.window.cursor[0] - 10, -1):
  if (i > 0):
    name_match = test_name_exp.match(current.window.buffer[i])
    if (name_match):
     command("return '%s'" % name_match.group(1))
EOF
endfunction

function! RunRuby(command)
python << EOF
from vim import *
command("!ruby %s" % eval('a:command'))
EOF
endfunction
command! -nargs=1 Execruby :call RunRuby(<args>)

