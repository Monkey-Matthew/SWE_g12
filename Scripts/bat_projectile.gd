extends CharacterBody2D

@export var SPEED = 150  # Speed of the projectile
@export var damage_amount = .25
var dir : Vector2  # Make dir a Vector2 to store the direction
var spawnPos : Vector2
var spawnRot : float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot  # Set the initial rotation if needed

func _physics_process(delta: float):
	# Move in the direction of 'dir'
	velocity = dir * SPEED  # Apply speed to the direction
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Health.take_damage(damage_amount)
	
	if !(body.is_in_group("bats")):
		queue_free()
