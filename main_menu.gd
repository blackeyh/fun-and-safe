extends Control

# Path to the save file (config file that stores the level)
var save_file_path = "user://level_save.cfg"

# Mapping level numbers to scene paths
var level_scenes = {
	1: "res://Main.tscn",
	2: "res://level2.tscn",
	3: "res://level3.tscn",
	4: "res://level4.tscn",
	5: "res://level5.tscn",
	6: "res://level6.tscn"
}

# Function to load the saved level
func load_saved_level() -> int:
	var config = ConfigFile.new()
	var error = config.load(save_file_path)
	if error == OK:
		return config.get_value("game_data", "current_level", 1)  # Default to 1 if not found
	elif error == ERR_FILE_NOT_FOUND:
		print("No save file found, starting from level 1")
		return 1  # Default to level 1
	else:
		print("Error loading config file:", error)
		return 1  # Default to level 1 on error

# Handle play button press
func _on_playbutton_pressed() -> void:
	# Load the saved level
	var saved_level = load_saved_level()
	
	# Get the scene path for the saved level
	var scene_path = level_scenes.get(saved_level, "res://Main.tscn")  # Default to Main.tscn
	
	# Change to the corresponding scene
	get_tree().change_scene_to_file(scene_path)

# Handle exit button press
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_new_button_pressed() -> void:
	# Reset the saved level to 1
	var config = ConfigFile.new()
	var save_file_path = "user://level_save.cfg"  # Ensure this matches the save file path used elsewhere
	
	# Load the config file
	var error = config.load(save_file_path)
	if error != OK and error != ERR_FILE_NOT_FOUND:
		print("Error loading config file:", error)
		return
	
	# Set the current level to 1 and save it
	config.set_value("game_data", "current_level", 1)
	error = config.save(save_file_path)
	
	if error != OK:
		print("Error saving level:", error)
	else:
		print("Level reset to 1 and saved successfully.")
	
	# Start the game from level 1
	get_tree().change_scene_to_file("res://Main.tscn")
	
