# Power Enable Function
# ===== POWER ENABLE FUNCTION =====
tag @s add power_owner
tellraw @s [{"text":"HLPowers: ","color":"gold","bold":true},{"text":"You have been granted access to the power!","color":"dark_purple","bold":false}]
playsound entity.player.levelup player @s ~ ~ ~ 2 0.9
playsound block.beacon.activate player @s ~ ~ ~ 1.6 1
advancement grant @s only hl_powers:the_power_within