extends Node2D

@onready var canvas = $CanvasLayer
@onready var back_button = $CanvasLayer/BackBox/BackArea
@onready var player = $"../Player"
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	canvas.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
