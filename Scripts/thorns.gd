extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not body.invulnerable:
		Health.player_health -= .25 #Change later
		# playerDied = true  I suspect we may need this later.
		pass
	else:
		#print("Player is invulnerable!") # For testing. Will spam console.
		pass # Nothing happens if they're invulnerable.
