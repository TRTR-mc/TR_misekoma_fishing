#> fishing:fishing/loop
# @within function fishing:fishing/_

particle dust 1 1 1 0.3 ~ ~ ~ 0 0 0 0 1 force

execute unless entity @e[type=marker,tag=String,distance=..0.06] facing entity @e[type=marker,tag=String,distance=..40,limit=1,sort=nearest] feet positioned ^ ^ ^0.1 run function fishing:fishing/loop