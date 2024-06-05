
file ./vuln
set exec-wrapper env -u LINES -u COLUMNS
run < malicious_input
exit 0

