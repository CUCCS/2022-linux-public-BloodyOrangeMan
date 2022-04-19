#!/usr/bin/env bash

PARSED_ARGUMENTS=$(getopt -a -n worldcup -o ahf:pnA --long file:,age,help,file,position,name,findage -- "$@")

eval set -- "$PARSED_ARGUMENTS"

usage(){
  cat <<EOF
Usage: imgprocessing [options] <parameter>

-h | --help                                  This is some help text.
-f | --file      <file path>                 Input the path or directory where the tsv is located
-a | --age                                   Statistics on the number and percentage of players in different age ranges (under 20, [20-30], over 30)
-p | --position                              Statistics on the number and percentage of players in different positions on the field
-n | --name                                  Statistics of the player with the longest name and the player with the shortest name
-A | --findage                               Statistic of the oldest player and the youngest player

EOF
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

agecount(){
under20=$(awk  '
    $6<20{
        cnt++
    }
    END{
        printf cnt
    }
    ' "$filepath")

middle=$(awk  '
    20<=$6 && $6<=30{
        cnt++
    }
    END{
        printf cnt
    }
    ' "$filepath")

over30=$(awk  '
    30<$6{
        cnt++
    }
    END{
        printf cnt
    }
    ' "$filepath")

total=$(("$under20"+"$middle"+"$over30"))
percentage1=$(echo "scale=3; $under20 / $total * 100" | bc)
percentage2=$(echo "scale=3; $middle / $total * 100" | bc)
percentage3=$(echo "scale=3; $over30 / $total * 100" | bc)

echo "
|--------------------------------------------------------------------------------|
|                                                                                   
|    The number of players younger than 20 years old is $under20                 
|    The number of players between 20 and 30 years old is $middle                  
|    The number of players older than 30 years old is $ $over30                  
|                                                                                
|--------------------------------------------------------------------------------|
|                                                                                
|    The percentage of players younger than 20 years old is $percentage1        
|    The percentage of players between the ages of 20 and 30 is $percentage2
|    The percentage of players over 30 years old is $percentage3              
|                                                                                
|--------------------------------------------------------------------------------|
"
exit 0

}

countposition(){
    
    awk -F '\t' 'BEGIN{sum=0;}
    NR > 1 {pos[$5]++; sum++;}
    END{
        for (p in pos){printf("%s:\t%d\t%.3f\n",p,pos[p],pos[p]/sum*100);}
    }' "$1"


    exit 0
}

findname(){
 
        awk -F '\t' 'BEGIN{ max=0; min=1000; }
    NR>1 { 
        l=length($9);
        
        names[$9]=l;
        
        max=l>max?l:max;
        
        min=l<min?l:min; 
    }        
    END{
        for(i in names){            
            if(names[i]==max){
                print " The player with the longest name is:\t "i
            }
            else if(names[i]==min){
                print " The player with the shortest name is:\t "i 
            }
        }
    } ' "$1"

    exit 0
}

findages(){
 
        awk -F '\t' 'BEGIN{ max=0; min=1000; }
    NR>1 { 
        
        names[$9]=$6;
        
        max=$6>max?$6:max;
        
        min=$6<min?$6:min; 
    }        
    END{
        for(i in names){            
            if(names[i]==max){
                print " The oldest players are:\t "i
            }
            else if(names[i]==min){
                print " The youngest player is:\t "i 
            }
        }
    } ' "$1"

    exit 0
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
    -a | --age)
        agecount "$filepath"
        shift ;; 
    -p | --position)
        countposition "$filepath"
        shift ;; 
    -n | --name)
        findname "$filepath"
        shift  ;;
    -A | --findage)
        findages "$filepath"
        shift  ;;
    *) echo "Unexpected option: $1 - this should not happen."
    usage ;;
  esac
done