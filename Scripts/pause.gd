extends Node

var paused = false
@onready var pauseMenuObj = $PauseMenu
@onready var resumeButton = $PauseMenu/VBoxContainer/Resume
@onready var exitButton = $PauseMenu/VBoxContainer/Exit

# ready func
func _ready():
	pauseMenuObj.hide()
	# Connect the resume button to the pauseMenu function
	resumeButton.pressed.connect(pauseMenu)
	exitButton.pressed.connect(quit)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func quit():
	get_tree().quit()

func pauseMenu():
	if paused:
		print("un-pausing")
		pauseMenuObj.hide()
		Engine.time_scale = 1
	else:
		print("pausing")
		pauseMenuObj.show()
		Engine.time_scale = 0
		
	paused = !paused
	
