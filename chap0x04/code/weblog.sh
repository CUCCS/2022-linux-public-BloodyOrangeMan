#!/usr/bin/env bash
PARSED_ARGUMENTS=$(getopt -a -n weblog -o viucg:f:hp --long file:,visit,ip,url,code400,given:,file:,help,percentage -- "$@")

eval set -- "$PARSED_ARGUMENTS"

usage(){
  cat <<EOF
Usage: imgprocessing [options] <parameter>

-h | --help                                   This is some help text.
-f | --file          <file path>              Input the path or directory where the tsv is located
-v | --visit                                  Statistics on the TOP 100 hosts visited and the total number of appearances corresponding to each
-i | --ip                                     Statistics on the TOP 100 IPs of the source host and the total number of appearances respectively                          
-u | --url                                    Statistics on the most frequently visited URLs TOP 100
-c | --code400                                Counting the TOP 10 URLs for different 4XX status codes and the total number of occurrences respectively
-p | --percentage                             Count the number of occurrences of different response status codes and the corresponding percentage
-g | --given          <url>                   Given the URL output TOP 100 access source hosts

EOF
  exit 0
}

countvisits(){
    awk -F '\t' '{print $1}' "$1" | sort | uniq -c | sort -nr | head -n 100
    exit 0
}

countvisitsIP(){
    awk --re-interval -F '\t' '{match($0,/([0-9]{1,3}\.){3}[0-9]{1,3}/,a); print a[0]}'  "$1" | sort | uniq -c | sort -nr | head -n 100
    exit 0
}

counturl(){
    awk -F '\t' '{print $5}' "$1" | sort | uniq -c | sort -nr | head -n 100
    exit 0
}

countcode(){
    awk -F '\t' '{print $6}' "$1" | sort | uniq -c | sort -nr | head -n 6
    exit 0
}


codepercentage(){
    awk -F '\t' '{print $6}' "$1" | sort | uniq -c | sort -nr | head -n 6| awk '{b[$2]=$1;sum=sum+$1} END{for (i in b) print i,b[i],(b[i]/sum)*100}'  |sort -k 3 -r -n
    exit 0
}

codetophost(){

echo 404:

awk --re-interval -F '\t' '  NR>1{
        if($6==404){
            print($0)
        }
    }'  "$1" | awk -F '\t' '{print $5}' | sort | uniq -c | sort -nr | head -n 10

echo ---------

echo 403:

awk --re-interval -F '\t' '  NR>1{
        if($6==403){
            print($0)
        }
    }'  "$1" | awk -F '\t' '{print $5}' | sort | uniq -c | sort -nr | head -n 10
    exit 0
}

urltophost(){

    awk -F '\t' -v url="$2" '
    NR>1{
        if(url==$5){
            print $1 
        }
    }
    ' "$1" | sort | uniq -c | sort -nr | head -100
    exit 0
}

filecheck(){
  if  [[  -f $1 ]]; then
    echo "OK" > /dev/null
  else
    echo "Invalid file path"
    exit 1
  fi
}

while :
do
  case "$1" in
    -h | --help)
    usage ;;
    -f | --file)   
        filepath="$2"
        filecheck "$filepath"
        shift 2 ;;
    -v | --visit)
        countvisits "$filepath"
        shift ;; 
    -i | --ip)
        countvisitsIP "$filepath"
        shift ;; 
    -u | --url)
        counturl "$filepath"
        shift  ;;
    -c | --code400)
        codetophost "$filepath"
        shift  ;;
    -p | --percentage)
        codepercentage "$filepath"
        shift  ;;
    -g | --given)
        urltophost "$filepath" "$2"
        shift 2 ;;
    *) echo "Unexpected option: $1 - this should not happen."
    usage ;;
  esac
done