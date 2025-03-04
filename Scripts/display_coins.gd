extends CanvasLayer

@onready var coin_label: Label = $CoinLabel


func _ready() -> void:
	coin_label.text = str(CoinSystem.player_coins)

func _process(delta: float) -> void:
	coin_label.text = str(CoinSystem.player_coins)
