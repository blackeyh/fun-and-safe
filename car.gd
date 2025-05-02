extends CharacterBody2D

# Variables to handle movement
var velocitycar = 700 # Speed of movement
var move_direction = 1  # 1 for right, -1 for left
var timer = 0  # Timer to control the movement duration

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Start by moving to the right
	move_direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the timer
	timer += delta
	
	# Move to the right for 2 seconds
	if timer < 2:
		# Move the body to the right (positive direction)
		position.x += velocitycar * move_direction * delta
		# Flip the sprite to face the right (set scale.x to 1)
		$sprite.scale.x = 1
	elif timer < 4:
		# After 2 seconds, change direction and move to the left
		move_direction = -1
		position.x += velocitycar * move_direction * delta
		# Flip the sprite to face the left (set scale.x to -1)
		$sprite.scale.x = -1
	else:
		# Reset the timer and alternate direction every 2 seconds
		timer = 0
		move_direction = 1  # Reset to move to the right
