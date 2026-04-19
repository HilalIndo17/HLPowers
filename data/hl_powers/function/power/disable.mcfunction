# Power Enable Function
# ===== POWER ENABLE FUNCTION =====
tag @s remove power_owner
tellraw @s [{"text":"HLPowers: ","color":"gold","bold":true},{"text":"Success took the powers from you!","color":"dark_purple","bold":false}]
playsound block.amethyst_block.break player @s ~ ~ ~ 2