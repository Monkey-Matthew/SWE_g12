extends CharacterBody2D

@export var speed: float = 300.0  # Speed of the projectile
var direction: Vector2 = Vector2.ZERO  # Movement direction

func _ready():
	velocity = direction * speed  # Set initial velocity

func _physics_process(delta):
	velocity = direction * speed  # Keep moving in the set direction
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		print("Hit enemy")
		queue_free()
	if !(body.is_in_group("enemies")):
		queue_free()
