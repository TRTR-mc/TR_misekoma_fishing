#> fishing:bober/spawn_marker
# @within function fishing:bober/_

# spawn
execute at @a[tag=bait] run kill @e[type=marker,tag=bober,distance=..20]
execute at @a[tag=bait] positioned as @e[type=fishing_bobber,distance=..20,limit=1] run summon marker ~ ~ ~ {Tags:["bober"]}
tag @a remove bait