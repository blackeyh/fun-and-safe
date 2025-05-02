extends Area2D

@onready var anim = $AnimatedSprite2D
var is_collected: bool = false  # Flag to track if the coin has been collected

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")  # Set the default animation on start
	connect("body_entered", Callable(self, "_on_body_entered"))

# Called when another body enters the area.
func _on_body_entered(body):
	# Only react if the body is a CharacterBody2D and the coin hasn't been collected yet
	if body is CharacterBody2D and not is_collected and body.name == "player":
		is_collected = true  # Mark the coin as collected
		collision_layer = 0  # Disable collision to prevent multiple collections
		
		anim.play("collected")
		await anim.animation_finished

		# Update the coin count globally
		Global.coin_count += 1  # Increment the global coin count
		print("Coins collected:", Global.coin_count)  # Print coin count for debugging

		# Emit signal to update the counter display
		Global.emit_signal("coin_count_changed")

		# Remove the coin from the scene
		queue_free()
