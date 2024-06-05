
file ./vuln
break 8
set exec-wrapper env -u LINES -u COLUMNS
run
p/x &username
p/x $ebp
x $ebp
exit 0

