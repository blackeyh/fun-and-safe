extends StaticBody2D

# Tint effect duration
var red_tint_duration: float = 0.5
# Hurt animation duration (in seconds)
var hurt_animation_duration: float = 1.0
# Delay after hurt animation ends before resetting the scene
var reset_delay: float = 2.0

# Variables to hold the sprite and original color for resetting
var original_modulate: Color = Color(1, 1, 1)  # Default white color

func _ready():
	# Ensure the flame animation plays continuously if using an animated sprite

	# Connect the body_entered signal of Area2D to detect collisions
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))

# Triggered when another body enters the area
func _on_body_entered(body: Node) -> void:
	print("Body entered: ", body.name)  # Debug: Check which body triggered the event

	# Only react if the body is a CharacterBody2D and the player
	if body is CharacterBody2D and body.name == "player":
		Global.emit_signal("hurt")
		Global.is_hurt = true
		print("Player collision detected.")  # Debug: Ensure this condition is met
		Global.hurtbuttonpressed = false
		# Apply red tint
		_apply_red_tint(body)
		print("Red tint applied.")  # Debug: Confirm red tint was applied

		# Play the "hurt" animation on the player's sprite
		var player_sprite: AnimatedSprite2D = body.get_node("character")  # Adjust path if needed
		if player_sprite:
			print("Found player sprite: ", player_sprite)  # Debug: Ensure the sprite node is found
			
			# Stop the current animation (if looping) and play the hurt animation
			player_sprite.stop()
			print("Stopped current animation.")  # Debug: Confirm stop call
			player_sprite.play("hurt")  # Replace with the actual animation name
			print("Should animate 'hurt'.")  # Debug: Indicate animation will play
		else:
			print("Player sprite not found! Check the node path.")  # Debug: Warn if sprite is missing

		# Keep the player on the object by setting velocity to 0
		if "velocity" in body:
			body.velocity = Vector2.ZERO
			print("Player velocity set to ZERO.")  # Debug: Confirm velocity change
		
		# Schedule scene reset after hurt animation + reset delay, passing the body
		_schedule_reset(hurt_animation_duration + reset_delay, body)
		print("Scheduled scene reset.")  # Debug: Confirm reset scheduling

func _apply_red_tint(body: CharacterBody2D):
	print("1")
	var sprite: AnimatedSprite2D = body.get_node("character")  # Adjust path if needed
	if sprite:
		print("2")
		# Apply red tint
		sprite.modulate = Color(1, 0, 0)
		# Create a Timer node to reset color after the duration


# Resets the color of the sprite after the red tint effect
func _reset_color(sprite: AnimatedSprite2D):
	if sprite:
		sprite.modulate = original_modulate

# Schedules the scene reset after a delay
# Schedules the game reset after a delay
func _schedule_reset(delay: float, body: CharacterBody2D):
	var timer = Timer.new()
	timer.wait_time = delay
	timer.one_shot = true
	# Pass the body to the _reset_game function
	timer.connect("timeout", Callable(self, "_reset_game").bind(body))
	add_child(timer)
	timer.start()

# Reload the current scene
# Reset game logic
func _reset_game(body: CharacterBody2D):
	print("Resetting game without reloading scene.")  # Debug: Reset logic starts
	
	# Reset the player position using the passed body
	if body:
			Global.is_hurt = false
			var sprite: AnimatedSprite2D = body.get_node("character")  # Adjust path if needed
			sprite.play("jump")
			sprite.modulate = original_modulate
			print("Resetting player position.")  # Debug: Reset player position
			body.position = Vector2(324, 551)  # Replace with your desired starting position
			if "velocity" in body:
				body.velocity = Vector2.ZERO  # Stop player movement if applicable
	else:
		print("Player body not found!")  # Debug: Warn if player is missing

	# Reset the panel visibility
