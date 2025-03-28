extends Area2D

func _on_body_entered(body: Node) -> void:
	CoinSystem.key_collected = true
	print("Key hit")

	var sound = get_node("AudioStreamPlayer2D")
	sound.play()

	# Detach the sound so it isn't deleted when the key is removed
	remove_child(sound)
	get_tree().get_root().add_child(sound)
	sound.global_position = global_position  # Optional: keep sound location

	queue_free()
