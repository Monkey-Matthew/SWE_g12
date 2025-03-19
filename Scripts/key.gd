extends Area2D

func _on_body_entered(body: Node2D) -> void: #If player collides with the key
	CoinSystem.key_collected = true #Key is collected
	print("Key hit") 
	queue_free() #Removes key from scene
