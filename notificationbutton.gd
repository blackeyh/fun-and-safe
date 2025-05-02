extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Optionally set an initial state for the button if needed
	text = "Default Text"  # Initial text for the button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check the global is_hurt variable
	if Global.is_hurt:
		if get_tree().current_scene.name == "main":
			# Set the message about staying away from fire
			text = "لأنها قد تحرقنا"
		elif get_tree().current_scene.name == "level2":
			text = "لأننا قد نغرق"
		elif get_tree().current_scene.name == "level3":
			text = "لأن السيارات قد تصدمنا"
		elif get_tree().current_scene.name == "level4":
			text = "لأنها قد تجرحنا"
		elif get_tree().current_scene.name == "level5":  # Added for level 5
			text = "لأنه قد يسبب لنا تسمم"
		elif get_tree().current_scene.name == "level6":  # Added for level 6
			text = "لأننا قد نبتلعها ، فتسبب لنا الاختناق"
	elif Global.hurtbuttonpressed == true:
		text = "حسنا"  # Replace with your desired default text
