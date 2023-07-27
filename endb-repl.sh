#!/usr/bin/env bash

PS3="Choose MIME Type: "

items=("application/json" "application/x-ndjson" "application/ld+json" "text/csv")

select item in "${items[@]}"
do
    case $REPLY in
        1) echo "Selected $item"; break;;
        2) echo "Selected $item"; break;;
        3) echo "Selected $item"; break;;
        4) echo "Selected $item"; break;;
        *) echo "Unknown choice: $REPLY";;
    esac
done

echo "CTRL+D to execute, CTRL+C to quit"

while true; do
    echo ""
    echo -n "SQL> "
    curl -d @- -H "Content-Type: application/sql" -H "Accept: $item" -X POST http://localhost:3803/sql
done
