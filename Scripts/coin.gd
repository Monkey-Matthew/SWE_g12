extends Area2D




func _on_body_entered(body: Node2D) -> void:
	CoinSystem.player_coins += 1
	print("coin hit") 
	queue_free()
