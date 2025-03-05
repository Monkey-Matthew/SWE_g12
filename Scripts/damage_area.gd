extends Area2D

@export var damageAmount: float

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not body.invulnerable:
		Health.player_health -= damageAmount #Change later
		# playerDied = true  I suspect we may need this later.
		pass
	else:
		#print("Player is invulnerable!") # For testing. Will spam console.
		pass # Nothing happens if they're invulnerable.
