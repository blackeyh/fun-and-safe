extends Sprite2D

# Variable to track the timer for visibility delay
var visibility_timer: float = 0.0

func _process(delta: float) -> void:
	if Global.hurtbuttonpressed:
		# If the button is pressed, start the timer
		visibility_timer += delta
		if visibility_timer >= 3.0:  # After 3 seconds
			self.visible = true
			visibility_timer = 0.0  # Reset the timer
	else:
		# If the button is not pressed, hide the sprite and reset the timer
		self.visible = false
		visibility_timer = 0.0
