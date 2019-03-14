Excellent players and their Super Team Golden State Warriors
================
Chengcheng Feng

``` r
library(jpeg)
library(grid)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(knitr)
library(kableExtra)
```

    ## Warning: package 'kableExtra' was built under R version 3.5.3

``` r
library(ggplot2)
shots_data1<-read.csv("../data/shots-data.csv",stringsAsFactors = FALSE)
```

Introduction
------------

Since Steve Kerr took over the team, the Warriors have gone 265-63 over four seasons, they’ve won three NBA Championships, and had the best single season record in history, 73-9 (which was also the only season they also lost the Finals). This report mainly foucuses on five typical outstanding players in the Warriors, Stephen Curry, Kevin Durant, Klay Thompson, Draymond Green and Andre Iguodala in the season 2016-2017.

Background
----------

After building a luxurious team with the acquisition of Kevin Durant in the offseason, the Golden State Warriors experienced a slow coalition with Curry's downturn and Durant's injury as well as the subsequent losing streak. Relying on their unlimited power, however,the Warriors finally took revenge for their NBA final and regained the championship, setting the best postseason record in NBA history by going 16–1.

There is no doubt that the Warriors can shoot. According to the advanced statistics provided by the NBA, the Effective Field Goal Percentage(EFG%) of the Warriors during the Regular Season is 56.3% in the Season 2016-2017, ranking first in the league. For more detailed explanation, the shot data of the five typical outstanding players mentioned above are shown and analyzed in the following paragraphs.

Data and Analysis
-----------------

### Shooting Efficency

From the Effective Shooting Percentage chart, we can see that Kevin Durant made the most effective shooting with approximately 54% efficency. Andre Iguodala ranks second although his total shot attempts were the least. On the contrary, the total shot attempts of Stephen Curry were the most, his effective shooting percentage only ranked the fourth with about 46.7%.

``` r
#Effective Shooting% by Player
player<-arrange(summarise(group_by(shots_data1,name),total=sum(shot_type=="2PT Field Goal"|shot_type=="3PT Field Goal"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
kable(player)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
915
</td>
<td style="text-align:right;">
495
</td>
<td style="text-align:right;">
0.5409836
</td>
</tr>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
371
</td>
<td style="text-align:right;">
192
</td>
<td style="text-align:right;">
0.5175202
</td>
</tr>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
1220
</td>
<td style="text-align:right;">
575
</td>
<td style="text-align:right;">
0.4713115
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
1250
</td>
<td style="text-align:right;">
584
</td>
<td style="text-align:right;">
0.4672000
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
578
</td>
<td style="text-align:right;">
245
</td>
<td style="text-align:right;">
0.4238754
</td>
</tr>
</tbody>
</table>
In fact, after the adjustment period of the role positioning in the team at the beginning of this season, Curry was far less sharper than the last season. He fell into self-doubt and experienced the most struggling period of career. Those three-pointers that should have been hand-picked for him could not be thrown to the rim. Besides, when the team was in an axious moment, he could no longer reverse the situation with a few incredible three points like the last season. Fortunately, Curry only took 10 days to regain the status after losing their first five games in March. The Warriors gradually regained their offensive pace after that difficult time.

### Two-pointer Shooting Efficency

According to the Two-pointer Effective Shooting chart, Iguodala made the most effective shooting with approximately 63.8% efficency, although again he had the least shot attempts. Durant ranked the second with around 60.7% efficency. However he made the most shot attempts. The following are Stephen Curry with about 54% efficency and Klay Thompson with 51.4% efficency.

``` r
#2PT Effective Shooting% by Player
pt2<-arrange(summarise(group_by(shots_data1,name),total=sum(shot_type=="2PT Field Goal"),made=sum((shot_type=="2PT Field Goal")&(shot_made_flag=="shot_yes")),perc_made=made/total),desc(perc_made))
kable(pt2)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
210
</td>
<td style="text-align:right;">
134
</td>
<td style="text-align:right;">
0.6380952
</td>
</tr>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
643
</td>
<td style="text-align:right;">
390
</td>
<td style="text-align:right;">
0.6065319
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
563
</td>
<td style="text-align:right;">
304
</td>
<td style="text-align:right;">
0.5399645
</td>
</tr>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
640
</td>
<td style="text-align:right;">
329
</td>
<td style="text-align:right;">
0.5140625
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
346
</td>
<td style="text-align:right;">
171
</td>
<td style="text-align:right;">
0.4942197
</td>
</tr>
</tbody>
</table>
During the offseason, in order to join Durant in, the Warriors cleaned most of the players in the former lineup. As a result, the team only had two main players Shaun Livingston and Andre Iguodala left in addition to Curry, Thompson and Green. Unfortunately, for a long time after the start of the season, Livingston's mid-range back was no longer accurate, and the times that Iguodala played as a key role was getting less and less. As the season progressed, these two supporting players of the Warriors gradually got into the groove. Durant’s injury gave Iguodala, Livingston more opportunities to perform.

### Dreadful accurate three-pointer efficency

From the Three-pointer Effective Shooting Percentage chart, it is obvious that Klay Thompson is the most stable killer in the team. The performance of Thompson made the Warriors become united and freed from the haze of previous internal conflict and continuous injury. As the record holder of the single-game three-point field goals in the playoffs, Thompson still played excellently in the season 2016-2017.

``` r
#3PT Effective Shooting% by Player
pt3<-arrange(summarise(group_by(shots_data1,name),total=sum(shot_type=="3PT Field Goal"),made=sum((shot_type=="3PT Field Goal")&(shot_made_flag=="shot_yes")),perc_made=made/total),desc(perc_made))
kable(pt3)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
580
</td>
<td style="text-align:right;">
246
</td>
<td style="text-align:right;">
0.4241379
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
687
</td>
<td style="text-align:right;">
280
</td>
<td style="text-align:right;">
0.4075691
</td>
</tr>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
272
</td>
<td style="text-align:right;">
105
</td>
<td style="text-align:right;">
0.3860294
</td>
</tr>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
161
</td>
<td style="text-align:right;">
58
</td>
<td style="text-align:right;">
0.3602484
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
232
</td>
<td style="text-align:right;">
74
</td>
<td style="text-align:right;">
0.3189655
</td>
</tr>
</tbody>
</table>
For Stephen Curry, the participation of Durant made it necessary for him to make changes on the offensive side, which actually influenced his field goal attempts. Although his three-point effective shooting percentage in this season hits the lowest during his career, Curry still has a history of 13 three-point field goals. And we still believe that Curry and Durant are bound to be the core of this amazing team.

More importantly, the team is no longer a team that only makes three-point field goals. Durant's defensive efficiency ranks second in the team, and the offensive efficiency is the first in the league. In addition, his average score per game, the efficiency value, the victory contribution value as well as the victory contribution value per 48-minute is the first among the Warriors. Undoubtedly, the Warriors’ reliance on the dominant position has changed. In fact, the Warriors is no longer a team that only foucus on shooting. Durant’s arrival has turned the team into a team that is hard to beat. What's more, the offensive efficiency, pace as well as the defensive efficency in this season has exceeded the 73-win season. This is a team that is becoming perfect.

<img src="../images/gsw-shot-chart.png" width="80%" style="display: block; margin: auto;" />

Conclusion
----------

In sumary, these five players are all indispensable and contributing to the success of the team. And the Super Team, the Golden State Warriors have made a habit of bringing statistical impossibilities into reality. What miracles can they continue to create? Just wait and see.
