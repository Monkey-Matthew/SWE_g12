extends Area2D

var playerDied: bool = false # Not being used right now.

func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		if body.is_in_group("player") and not body.invulnerable:
			print("Player died") # For testing. Will spam console.
			# playerDied = true  I suspect we may need this later.
			pass
		else:
			print("Player is invulnerable!") # For testing. Will spam console.
			pass # Nothing happens if they're invulnerable.


# The for loop is to continually check whether or not there's a body inside the collision. 
# The original trap code checked if a player had walked into it, but now that they can over jump it needs to check instead
# if the player has walked into it, or if they mistimed their jump. 
