extends CharacterBody2D

const SPEED = 5 #Movement Speed (Change to fit character movement)
@onready var animated_sprite = $AnimatedSprite2D
@export var sizeOfPath: float = 10.0
@onready var POV = $"Point of View"
@onready var body = $CollisionShape2D
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
		POV.rotation = 0
	elif phase == 1:
		#Move Down
		x = sizeOfPath
		y = progress
		POV.rotation = 90
	elif phase == 2:
		#Move left
		x = sizeOfPath - progress
		y = sizeOfPath
		animated_sprite.play("LeftMovement")
		POV.rotation = 180
	elif phase == 3:
		#Move up
		x = 0
		y = sizeOfPath - progress
		animated_sprite.play("UpwardMovement")
		POV.rotation = 270
	

	position = startingPosition + Vector2(x, y) 
	
func _on_POV_entered(body):
	if body.name == "Player":
		print("Player entered POV");
func _on_POV_Exit(body):
	if body.name == "Player":
		print("Player exited POV");
