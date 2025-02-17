extends CharacterBody2D

const SPEED = 5 #Movement Speed (Change to fit character movement)
@onready var animated_sprite = $AnimatedSprite2D
@export var sizeOfPath: float = 10.0
@onready var POV = $"Point of View"
@onready var rat_body = $CollisionShape2D
var direction = -1
var time: float = 0.0
var startingPosition: Vector2

func _ready() -> void:
	startingPosition  = position
	time += SPEED+ (randf() * 100)
	

func _process(delta: float) -> void:
	
	time += delta * SPEED 

	# Square Movement
	var x = 0.0
	var y = 0.0
	
	var phase = int(time / sizeOfPath) % 4
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
	
	#print(Health.player_health)
	


func _on_point_of_view_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player entered POV");

func _on_point_of_view_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Player exited POV");
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Health.player_health -= .25
