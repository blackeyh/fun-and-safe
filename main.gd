extends Node2D

@onready var coin_counter_label = $CanvasLayer/CoinCounter  # Adjust path if needed

func _ready():
	update_coin_counter()  # Initialize the counter display
	Global.connect("coin_count_changed", Callable(self, "update_coin_counter"))  # Use Callable to reference the method
	Global.coin_count = 0 # Increment the global coin count
	

func update_coin_counter():
	# Update the label text with the current coin count
	coin_counter_label.text = "Coins: " + str(Global.coin_count)
