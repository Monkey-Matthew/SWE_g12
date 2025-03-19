extends CanvasLayer

@onready var key_image: Sprite2D = $Sprite2D #Reference to the key image

func _process(delta: float) -> void:
	if CoinSystem.key_collected == false: #Checks to see if a key has been collected if so the image on the display will appear
		key_image.visible = false
	else:
		key_image.visible = true
