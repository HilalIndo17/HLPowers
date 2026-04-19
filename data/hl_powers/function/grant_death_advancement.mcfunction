execute as @s[tag=power_owner] at @s run advancement revoke @s only hl_powers:check_death
execute as @s[tag=power_owner] at @s run advancement grant @s only hl_powers:power_without_immortality
execute as @s[tag=power_owner] at @s run scoreboard players reset @s deathCount