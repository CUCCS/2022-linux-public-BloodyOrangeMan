###   更多操作统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员**数量**、百分比

> ```
>  ./worldcup.sh -f worldcupplayerinfo.tsv -a
> |--------------------------------------------------------------------------------|
> |                                                                                   
> |    The number of players younger than 20 years old is 9                 
> |    The number of players between 20 and 30 years old is 540                  
> |    The number of players older than 30 years old is $ 188                  
> |                                                                                
> |--------------------------------------------------------------------------------|
> |                                                                                
> |    The percentage of players younger than 20 years old is 1.200%        
> |    The percentage of players between the ages of 20 and 30 is 73.200%    
> |    The percentage of players over 30 years old is 25.500%                
> |                                                                                
> |--------------------------------------------------------------------------------|
> ```

###   统计不同场上位置的球员**数量**、百分比

> ```
>  ./worldcup.sh -f worldcupplayerinfo.tsv -p
> Défenseur:      1       0.136%
> Midfielder:     268     36.413%
> Defender:       236     32.065%
> Forward:        135     18.342%
> Goalie: 96      13.043%
> ```

###   年龄最大的球员是谁？年龄最小的球员是谁？

> ```
>  ./worldcup.sh -f worldcupplayerinfo.tsv -A
> The youngest player is:         Luke Shaw
> The oldest players are:         Faryd Mondragon
> The youngest player is:         Fabrice Olinga
> ```

### 名字最长的球员是谁？名字最短的球员是谁？

> ```
>  ./worldcup.sh -f worldcupplayerinfo.tsv -n
> The player with the longest name is:    Lazaros Christodoulopoulos
> The player with the longest name is:    Francisco Javier Rodriguez
> The player with the longest name is:    Liassine Cadamuro-Bentaeba
> The player with the shortest name is:   Jô
> ```