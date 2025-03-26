extends Node2D

@onready var gate_animation = $AnimatedSprite2D
@onready var staticBody = $StaticBody2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not gate_animation.is_playing():
		gate_animation.play("Open")

func _on_animated_sprite_2d_animation_looped() -> void:
	gate_animation.play("StayOpen")
	staticBody.disabled = true
