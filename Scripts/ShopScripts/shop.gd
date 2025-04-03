extends CanvasLayer

@onready var coin_label: Label = $CoinLabel
@onready var sprite_first_heart: Sprite2D = $FirstHeart
@onready var sprite_second_heart: Sprite2D = $SecondHeart
@onready var sprite_third_heart: Sprite2D = $ThirdHeart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_coins = CoinSystem.player_coins
	coin_label.text = str(current_coins)
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
