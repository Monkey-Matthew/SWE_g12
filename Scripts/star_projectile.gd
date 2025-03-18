extends CharacterBody2D

@export var speed: float = 300.0  # Speed of the projectile
@export var damage: int = 50
var direction: Vector2 = Vector2.ZERO  # Movement direction

func _ready():
	velocity = direction * speed  # Set initial velocity

func _physics_process(delta):
	velocity = direction * speed  # Keep moving in the set direction
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if the body is in the "enemies" group
	if body.is_in_group("enemies"):
		# Get the "Health" child node
		var health_node = body.get_node("Health")  # The child node named "Health"

		# Check if the "Health" node has the "take_damage" method
		if health_node.has_method("take_damage"):
			print("Taking damage")
			# Apply damage to the Health node
			health_node.take_damage(damage)
		
		print("Hit enemy")
		queue_free()  # Destroy the projectile after it hits the enemy

	# Destroy the projectile if it hits anything other than an enemy
	if !body.is_in_group("enemies"):
		queue_free()  # Destroy the projectile when it hits anything that is not an enemy
