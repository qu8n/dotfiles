#!/bin/zsh

mvn checkstyle:checkstyle
find * -name checkstyle_report.txt -print | xargs grep -v -E "^Starting audit|^Audit done" > checkstyle_report_compiled.txt
if [[ $(wc -l < checkstyle_report_compiled.txt) -gt 0 ]]; then
    cat checkstyle_report_compiled.txt
else
    echo "No checkstyle issues found"
fi
