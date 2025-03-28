extends CanvasLayer

@onready var coin_label: Label = $CoinLabel
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var previous_coin_count := -1

func _process(delta: float) -> void:
	var current_coins = CoinSystem.player_coins
	if current_coins != previous_coin_count:
		coin_label.text = str(current_coins)
		audio_player.play()
		previous_coin_count = current_coins
