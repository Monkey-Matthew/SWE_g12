extends CanvasLayer

@onready var sprite_first_heart: Sprite2D = $FirstHeart
@onready var sprite_second_heart: Sprite2D = $FirstHeart2
@onready var sprite_third_heart: Sprite2D = $FirstHeart3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Health.player_health == 3.0:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/FullHeart.png")
	elif Health.player_health == 2.75:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/ThreeFourthHeart.png")
	elif Health.player_health == 2.50:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/HalfHeart.png")
	elif Health.player_health == 2.25:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/QuaterHeart.png")
	elif Health.player_health == 2.0:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 1.75:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/ThreeFourthHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 1.50:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/HalfHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 1.25:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/QuaterHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 1.0:
		sprite_first_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/FullHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 0.75:
		sprite_first_heart.texture = load("res://TestSprites/ThreeFourthHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/EmptyHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 0.50:
		sprite_first_heart.texture = load("res://TestSprites/HalfHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/EmptyHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 0.25:
		sprite_first_heart.texture = load("res://TestSprites/QuaterHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/EmptyHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
	elif Health.player_health == 0.00:
		sprite_first_heart.texture = load("res://TestSprites/EmptyHeart.png")
		sprite_second_heart.texture = load("res://TestSprites/EmptyHeart.png")
		sprite_third_heart.texture = load("res://TestSprites/EmptyHeart.png")
