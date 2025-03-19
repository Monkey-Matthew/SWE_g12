extends Area2D

func _on_body_entered(body: Node2D) -> void: #If player collides with coin
	CoinSystem.player_coins += 1 #Adds to total coin count
	print("coin hit") 
	queue_free() #Removes coin from scene
