extends Node

signal coin_count_changed
signal hurt

var coin_count: int = 0
var hurtbuttonpressed = true
var is_hurt: bool = false  # Global variable to track if the player is hurt

# The current level global variable
var current_level: int = 1

# Path to the save file (config file that stores the level)
var save_file_path = "user://level_save.cfg"  # Use user:// for writable storage

# Save the current level to a config file
func save_level(level: int):
	var config = ConfigFile.new()  # Create a new ConfigFile instance

	# Load the config file (optional; creates a new one if it doesn't exist)
	var error = config.load(save_file_path)
	if error != OK and error != ERR_FILE_NOT_FOUND:
		print("Error loading config file for saving:", error)
		return

	# Set the current level in the config file
	config.set_value("game_data", "current_level", level)

	# Save the config file
	var save_error = config.save(save_file_path)
	if save_error == OK:
		print("Level saved successfully:", level)
	else:
		print("Error saving level:", save_error)

# Load the saved level from the config file
func load_level() -> int:
	var config = ConfigFile.new()  # Create a new ConfigFile instance
	var error = config.load(save_file_path)  # Load the config file

	if error == OK:
		# Retrieve the current level from the config file
		var saved_level = config.get_value("game_data", "current_level", 1)  # Default to 1 if not found
		print("Loaded level:", saved_level)
		return saved_level
	elif error == ERR_FILE_NOT_FOUND:
		print("No save file found, starting from level 1")
		return 1  # Default to level 1 if no saved level
	else:
		print("Error loading config file:", error)
		return 1  # Default to level 1 on error

# Set the global current level
func set_current_level(level: int):
	current_level = level
	print("Current level set to:", current_level)
