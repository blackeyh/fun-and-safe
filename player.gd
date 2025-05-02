extends CharacterBody2D

# Variables for player stats
var score: int = 0
var speed: float = 400.0
var jump_force: float = 700.0
var gravity: float = 870.0

# Control flags
var can_move: bool = true  # Flag to control movement
var is_bouncing: bool = false  # Flag to indicate bouncing state
var bounce_duration: float = 0.03  # Time to disable movement during the bounce
var bounce_force: float = 200.0  # Bounce strength
var bounce_gravity_multiplier: float = 0.3  # Reduced gravity effect during bounce

# Accessing the Sprite node
@onready var sprite: AnimatedSprite2D = $character  # Using the correct node name

func _ready():
	# Reset the collision detection after a bounce
	set_process(true)

func _physics_process(delta):
	# Only move the character if movement is allowed
	if can_move:
		# Movement input
		if Input.is_action_pressed("move_left") and not ( sprite.animation == "hurt"):
			if  is_on_floor():
				sprite.play("walk")
			velocity.x = -speed
			  # Play walk animation when moving left
		elif Input.is_action_pressed("move_right") and not ( sprite.animation == "hurt") :
			velocity.x = speed
			if  is_on_floor():
				sprite.play("walk")
		elif is_on_floor() and ( sprite.animation == "jump"):
				velocity.x = 0
				is_bouncing = false  # Reset bouncing state
				sprite.play("default") 
		elif sprite.animation != "hurt" and sprite.animation != "jump" :
					velocity.x = 0
					sprite.play("default") 

		# Applying gravity
		if not is_on_floor() :
			velocity.y += gravity * delta

		# Jumping
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = -jump_force
			sprite.play("jump") 
		

		# Apply movement and handle collision with walls and floors
		move_and_slide()

		# Flip sprite depending on movement direction
		if velocity.x < 0:
			sprite.flip_h = true  # Flip sprite horizontally (left)
		elif velocity.x > 0:
			sprite.flip_h = false  # Flip sprite horizontally (right)

# Function to detect collisions and trigger the bounce effect
func on_collision_detected(direction: Vector2):
	print("Collision detected. Direction: ", direction)  # Debug: print direction

	# Only bounce when moving in the opposite direction of the collision
	if can_move:
		# Prevent movement during bounce
		is_bouncing = true
	
		# Apply bounce effect
		print("Velocity set to zero. Now applying bounce.")  # Debug: velocity zeroed

		# Check for the direction of the collision and apply a bounce
		if direction.length() > 0:
			var horizontal_bounce = -direction.x != 0
			var vertical_bounce = direction.y != 0 and (velocity.y != 0)

			if horizontal_bounce:
				if direction.x > 0:
					velocity.x = bounce_force
				else:
					velocity.x = -bounce_force
				velocity.y = -bounce_force
				move_and_slide()

			if vertical_bounce:
				velocity.y = -bounce_force
			else:
				print("No vertical bounce applied. Direction: ", direction)  # Debug: no vertical bounce


		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = bounce_duration
		timer.one_shot = true
		timer.start()

		await timer.timeout  # Wait for the timeout signal

		can_move = true  # Re-enable movement after bounce
		timer.queue_free()  # Free the timer node after use

	if is_on_floor():
		velocity.x = 0
