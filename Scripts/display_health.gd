extends CanvasLayer

#Refernces to Heart
@onready var sprite_first_heart: Sprite2D = $FirstHeart
@onready var sprite_second_heart: Sprite2D = $SecondHeart
@onready var sprite_third_heart: Sprite2D = $ThirdHeart

func _ready() -> void:
	pass

#Changes Health sprite for whatever the health is currently at
func _process(delta: float) -> void:
	if Health.player_health == 3.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
	elif Health.player_health == 2.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
	elif Health.player_health == 2.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
	elif Health.player_health == 2.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
	elif Health.player_health == 2.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 1.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 1.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 1.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 1.0:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/FullHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 0.75:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/ThreeFourthHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 0.50:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/HalfHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health == 0.25:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/QuaterHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
	elif Health.player_health <= 0.01:
		sprite_first_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_second_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
		sprite_third_heart.texture = load("res://Images/TestSprites/Heart/EmptyHeart.png")
