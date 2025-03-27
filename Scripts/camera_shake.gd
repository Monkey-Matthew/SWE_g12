extends Camera2D

var shake_amount := 0.0
var shake_decay := 5.0  # How quickly the shake effect fades

func _process(delta):
	if shake_amount > 0:
		offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
		shake_amount = max(shake_amount - shake_decay * delta, 0)  # Reduce shake over time
	else:
		offset = Vector2.ZERO  # Reset camera when shake ends

func apply_shake(amount: float):
	shake_amount = amount  # Set initial shake strength
