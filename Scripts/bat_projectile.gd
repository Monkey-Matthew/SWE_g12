extends CharacterBody2D

@export var SPEED = 150  #Speed of the projectile
@export var damage_amount = .25 #Damage that the projectile causes
var dir : Vector2  #Stores the direction
var spawnPos : Vector2 #Stores spawn position
var spawnRot : float #Stores spawn rotation

func _ready():
	global_position = spawnPos #Sets the initial position
	global_rotation = spawnRot  #Sets the initial rotation

func _physics_process(delta: float):
	velocity = dir * SPEED  #Apply speed to the direction
	move_and_slide() #Moves with velocity

func _on_area_2d_body_entered(body: Node2D) -> void: #Determines if the bat projectile hits something
	if body.name == "Player": #If the projectile hit the player
		Health.take_damage(damage_amount)
	
	if !(body.is_in_group("bats")): #If the projectile hits anything besides itself or another bat
		queue_free() #Removes it from the scene
