extends Area2D

# Path of the scene to load when the door is activated
var next_scene_path = "res://level4.tscn"

var insidethedoor = false
var player_animated_body: AnimatedSprite2D = null  # Store reference to the player's AnimatedBody

# Reference to the global script to update the current level
var global_script: Node = null

func _ready():
	# Retrieve the global script reference (assumed to be a singleton or autoload)
	global_script = get_node("/root/Global")  # Adjust path if needed

func _on_body_entered(body: Node2D) -> void:
	print("1")
	if body.name == "player":
		insidethedoor = true  # Replace "player" with the name of your player node
		set_process(true)     # Start processing input
		
		# Dynamically retrieve the AnimatedBody child
		if body.has_node("character"):
			player_animated_body = body.get_node("character")
		else:
			print("Error: AnimatedBody not found as a child of player!")

# Called when the player leaves the door area
func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		insidethedoor = false
		set_process(false)    # Stop processing input
		player_animated_body = null  # Clear reference when the player exits

# Check for input or animation when the player is near the door
func _process(delta):
	if insidethedoor:
		# Check for "ui_accept" input
		if Input.is_action_just_pressed("ui_accept"):
			enter_next_scene()

		# Check for "jump" animation in the AnimatedBody
		if player_animated_body and player_animated_body.animation == "jump":
			enter_next_scene()

# Transition to the next scene
func enter_next_scene():
	if next_scene_path != "":
		# Update the level in the global variable and the config file
		var level_number = get_level_number_from_scene(next_scene_path)  # Get the level number based on the scene path
		global_script.set_current_level(level_number)  # Update global level variable
		global_script.save_level(level_number)  # Save level to config file

		# Change the scene
		get_tree().change_scene_to_file(next_scene_path)
	else:
		print("No next level configured!")

# Helper function to get the level number based on the scene path
func get_level_number_from_scene(scene_path: String) -> int:
	if scene_path == "res://level2.tscn":
		return 2
	# Add conditions for other levels as needed
	# For example:
	elif scene_path == "res://level3.tscn":
		return 3
	# Default return value for unknown scenes
	elif scene_path == "res://level4.tscn":
		return 4
	elif scene_path == "res://level5.tscn":
		return 5
	elif scene_path == "res://level6.tscn":
		return 6
	return 1
