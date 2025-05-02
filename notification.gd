extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var label = $Label
var ok_button : Button  # Declare the button variable

# Variables to track if the slide-in animation has already been played
var animation_triggered_3 = false
var animation_triggered_6 = false
var animation_triggered_9 = false
var animation_triggered_12 = false  # New variable for 12
var animation_triggered_15 = false  # New variable for 15

# Cooldown for hurt-triggered animations
var last_animation_time: float = -5  # Tracks the last time the animation was triggered
var cooldown: float = 5  # Cooldown duration in seconds

func _ready():
	ok_button = label.get_node("Button")  # Get the Button node from the Label
	label.visible = false  # Initially hide the label
	ok_button.visible = false  # Hide the button until slide-in is done
	# Start monitoring coin count
	set_process(true)

func _process(_delta):
	var current_time = Time.get_ticks_msec() / 1000.0

	# Check if Global.coin_count matches specific values and trigger animation if not already played
	if Global.coin_count == 3 and not animation_triggered_3:
		animation_triggered_3 = true
		run_slide_in()

	elif Global.coin_count == 6 and not animation_triggered_6:
		animation_triggered_6 = true
		run_slide_in()

	elif Global.coin_count == 9 and not animation_triggered_9:
		animation_triggered_9 = true
		run_slide_in()

	elif Global.coin_count == 12 and not animation_triggered_12:  # Check for 12
		animation_triggered_12 = true
		run_slide_in()

	elif Global.coin_count == 15 and not animation_triggered_15:  # Check for 15
		animation_triggered_15 = true
		run_slide_in()

	# Check if Global.is_hurt and enforce cooldown for the slide-in animation
	if Global.is_hurt:
		if current_time - last_animation_time >= cooldown:  # Check if cooldown has passed
			run_slide_in()
			last_animation_time = current_time  # Update the last animation time

# Function to slide in the label and show the button after the animation
func run_slide_in():
	label.visible = true  # Make the label visible before sliding in
	animation_player.play("slidein")
	await animation_player.animation_finished  # Wait for slide-in to finish
	ok_button.visible = true  # Show the button after the label slides in

# Function to handle the button press
func _on_button_pressed() -> void:
	ok_button.visible = false  # Hide the button immediately
	animation_player.play("slideout")
	Global.hurtbuttonpressed = true
	await animation_player.animation_finished  # Wait for slide-out to finish
	label.visible = false  # Hide the label after sliding out
