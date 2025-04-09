extends CharacterBody2D

@export var speed: float = 300.0  #Speed of the projectile
@export var damage: int = 50 #Damage of the projectile
var direction: Vector2 = Vector2.ZERO  #Movement direction of projectile

@onready var star_sprite = $Sprite2D
@onready var star_light = $PointLight2D

func _ready():
	velocity = direction * speed  #Sets initial velocity
	star_sprite.texture = ShopItems.star_sprite
	star_light.color = ShopItems.star_color
	
func _physics_process(delta):
	star_sprite.texture = ShopItems.star_sprite
	star_light.color = ShopItems.star_color
	velocity = direction * speed  #The projectile keeps moving in the set direction
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void: #If the star projectile hits something
	#Checks if the body is in the "enemies" group
	if body.is_in_group("enemies"):
		#Get the "Health" child node
		var health_node = body.get_node("Health")

		#Check if the "Health" node has the "take_damage" method
		if health_node.has_method("take_damage"):
			print("Taking damage")
			#Apply damage to the enemy's Health node
			health_node.take_damage(damage)
		
		print("Hit enemy")
		queue_free()  #Destroy the projectile after it hits the enemy

	#Destroy the projectile if it hits anything other than an enemy
	if !body.is_in_group("enemies"):
		queue_free()
		
	# Destroy the destructable if it's hit by the enemy.
	# The projectile will still despawn, as group destructable isn't an enemy.
	if body.is_in_group("destructables"):
		print("Hit destructible")
		if body.has_method("spawn_coins"):
			body.spawn_coins()
		body.queue_free()
		queue_free()  
