extends Area2D

@onready var shop = $"../Shop"

func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Player"):
		shop.canvas.visible = true
		Engine.time_scale = 0
		
