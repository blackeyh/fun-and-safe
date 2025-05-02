extends Panel
@onready var label = $Label
@onready var button = $Button

# Function to hide the text and button when the button is pressed
func _on_Button_pressed():
	label.visible = false  # Hide the text
	button.visible = false  # Hide the button
	Panel.visible = false
	# You can add further logic here to proceed with the game, like loading the next scene

# Ready function is called when the node is fully initialized
	# Optionally, you can set the text dynamically here or set it through the editor
	
	# Connect the button's pressed signal to the function


func _on_button_pressed() -> void:
	label.visible = false  # Hide the text
	button.visible = false 
	self.visible = false  # Hide the entire Panel

	pass # Replace with function body.
