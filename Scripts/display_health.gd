extends CanvasLayer

#Refernces to Heart
@onready var sprite_first_heart: Sprite2D = $FirstHeart
@onready var sprite_second_heart: Sprite2D = $SecondHeart
@onready var sprite_third_heart: Sprite2D = $ThirdHeart
@onready var sprite_fourth_heart: Sprite2D = $FourthHeart
@onready var sprite_fifth_heart: Sprite2D = $FifthHeart
@onready var sprite_first_shield: Sprite2D = $FirstShield
@onready var sprite_second_shield: Sprite2D = $SecondShield
@onready var sprite_third_shield: Sprite2D = $ThirdShield

@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound
var pause_menu
var shake_toggle

func _ready() -> void:
	pause_menu = get_node("/root/GameScene/Canvases/PauseCanvas/CenterContainer/Control/PauseMenu")
	shake_toggle = pause_menu.get_node("VBoxContainer/ShakeToggle")
	pass

#Changes Health sprite for whatever the health is currently at
func _process(delta: float) -> void:
	# check if the player loses health
	if Health.player_health < Health.prev_health and shake_toggle.text == "Screen Shake: On":
		# player took damage!!
		get_node("/root/GameScene/Player/Camera2D").apply_shake(5)
		hurt_sound.play()
		Health.prev_health = Health.player_health
	if Health.player_shield < Health.prev_shield and shake_toggle.text == "Screen Shake: On":
		# player took damage!!
		get_node("/root/GameScene/Player/Camera2D").apply_shake(5)
		hurt_sound.play()
		Health.prev_shield = Health.player_shield
	if Health.player_shield >= 3.0:
		Health.player_shield = 3
		sprite_first_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
		sprite_second_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
		sprite_third_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
	elif Health.player_shield == 2.0:
		sprite_first_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
		sprite_second_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
		sprite_third_shield.texture = load("null")
	elif Health.player_shield == 1.0:
		sprite_first_shield.texture = load("res://Images/TestSprites/Shield/shield.png")
		sprite_second_shield.texture = load("null")
		sprite_third_shield.texture = load("null")
	elif Health.player_shield <= 0.01:
		sprite_first_shield.texture = load("null")
		sprite_second_shield.texture = load("null")
		sprite_third_shield.texture = load("null")
	if Health.player_health >= 5.0:
		Health.player_health = 5
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fifth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
	elif Health.player_health == 4.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fifth_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
	elif Health.player_health == 4.5:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fifth_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
	elif Health.player_health == 4.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fifth_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
	elif Health.player_health == 4.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 3.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 3.5:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 3.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 3.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 2.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 2.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 2.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 2.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 1.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 1.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 1.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 1.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 0.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 0.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health == 0.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
	elif Health.player_health <= 0.01:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_fourth_heart.texture = load("null")
		sprite_fifth_heart.texture = load("null")
