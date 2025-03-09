extends CharacterBody2D

var SPEED = 15 #Movement Speed (Change to fit character movement)
@onready var animated_sprite = $AnimatedSprite2D
@export var sizeOfPath: float = 40.0
@onready var POV = $"Point of View"
@onready var rat_body = $CollisionShape2D
@onready var target = $"../Player"
var direction = -1
var time: float = 0.0
var startingPosition: Vector2
var is_following_player: bool = false

func _ready() -> void:
	startingPosition  = position
	time += SPEED+ (randf() * 100)
	

func _process(delta: float) -> void:
	
	time += delta * SPEED 
	#follows the charcter
	if is_following_player and target:
		var direction =(target.position-position).normalized()
		velocity = direction * SPEED
		if abs(direction.x) > abs(direction.y):
			# Moving left or right
			if direction.x > 0:
				animated_sprite.play("RightMovement")
				animated_sprite.flip_h = false  # Face right
			else:
				animated_sprite.play("LeftMovement")
				animated_sprite.flip_h = false   # Face left
		else:
			# Moving up or down
			if direction.y > 0:
				animated_sprite.play("DownwardMovement")  # Play down animation
			else:
				animated_sprite.play("UpwardMovement")    # Play up animation
	#Moves in the Square movement
	else:
		# Square Movement
		var x = 0.0
		var y = 0.0
		#Determines the start location
		var phase = int(time / sizeOfPath) % 4
		#How position of where on the location it spawn at.
		var progress = fposmod(time, sizeOfPath)
		if phase == 0:
			#Move Right
			x = progress
			y = 0
			animated_sprite.play("RightMovement")
			POV.rotation_degrees = 180
			POV.position.x = -2
			POV.position.y = -4
		
		elif phase == 1:
			#Move Down
			x = sizeOfPath
			y = progress
			POV.rotation_degrees = -90
			POV.position.x = 2
			POV.position.y = -4
		elif phase == 2:
		#Move left
			x = sizeOfPath - progress
			y = sizeOfPath
			animated_sprite.play("LeftMovement")
			POV.rotation_degrees = 0
			POV.position.x = 2
			POV.position.y = 0
		elif phase == 3:
			#Move up
			x = 0
			y = sizeOfPath - progress
			animated_sprite.play("UpwardMovement")
			POV.rotation_degrees = -270
			POV.position.x = -2

		position = startingPosition + Vector2(x, y) 
	move_and_slide()
	#print(Health.player_health)
	


func _on_point_of_view_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player entered POV");
		target = body
		is_following_player = true
		SPEED = 40

func _on_point_of_view_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Player exited POV");
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Health.player_health -= .25
