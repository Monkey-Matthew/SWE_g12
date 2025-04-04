extends TextureRect

@onready var canvas = $"../.."
var backButtonPressed = false

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		backButtonPressed = true
		canvas.visible = false
		Engine.time_scale = 1
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	backButtonPressed = false
