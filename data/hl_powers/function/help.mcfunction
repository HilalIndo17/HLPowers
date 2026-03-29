# Help function
# ===== HELP FUNCTION =====
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
tellraw @s [{"text":"✨ ","color":"light_purple","bold":true},{"text":"HLPowers - HELP","color":"gold","bold":true},{"text":" ✨","color":"light_purple","bold":true}]
tellraw @s [{"text":"-Note: ","color":"light_purple","bold":true},{"text":"All powers are only active when the player gains access to them.","color":"dark_purple","bold":false}]
tellraw @s [{"text":"-Command usage list power: ","color":"aqua","bold":true},{"text":"/function hl_powers:power/list/tier[<number>]_[<page>]","color":"blue","bold":false}]
tellraw @s [{"text":"-Command usage help: ","color":"aqua","bold":true},{"text":"/function hl_powers:help_[<page>]","color":"blue","bold":false}]
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s
