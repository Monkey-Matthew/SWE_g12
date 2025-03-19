extends Area2D

func _on_body_entered(body: Node2D) -> void: #If something enters the thorn area
	if body.name == "Player" and not body.invulnerable: #If the play is in the thorn area and is not invincible
		Health.player_health -= .25 #Change later possibly
		pass
	elif body.name == "Player" and body.invulnerable:
		#print("The player is currently invulnerable")
		pass
