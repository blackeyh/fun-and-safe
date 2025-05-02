extends Camera2D

# Reference to the character node
@onready var character = get_node("player")  # Adjust path as needed

func _process(delta):
	# Set the camera position to follow the character's position exactly
	position = character.position
