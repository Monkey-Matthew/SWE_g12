extends Area2D

func _on_body_entered(body: Node) -> void:
	CoinSystem.key_collected = true
	print("Key hit")

	var sound = get_node_or_null("AudioStreamPlayer2D")
	if sound:
		# Detach so the sound outlives the key
		remove_child(sound)
		get_tree().get_root().add_child(sound)
		sound.global_position = global_position
		sound.play()
	else:
		push_warning("No AudioStreamPlayer2D found on key instance!")

	queue_free()
