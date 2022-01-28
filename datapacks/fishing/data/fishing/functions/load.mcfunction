#> fishing:load
# @within tag/function minecraft:load

# スコア
scoreboard objectives add TR.fishing_rod used:fishing_rod "釣り始めの検知"
scoreboard objectives add TR.fish_caught custom:fish_caught "卍 死へのカウントダウン 卍"
scoreboard objectives add TR.timer dummy "タイマー"

scoreboard objectives add TR.death deathCount
scoreboard objectives add TR.respawn custom:time_since_death