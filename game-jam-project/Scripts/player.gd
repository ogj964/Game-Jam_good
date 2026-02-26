extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const no_JUMP_VELOCITY = 0

var time_jump = 1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") && time_jump == 1:
		velocity.y = JUMP_VELOCITY
		print("jump")
		time_jump - 1
		if time_jump == 0:
			velocity.y = no_JUMP_VELOCITY
			velocity.y= JUMP_VELOCITY
			time_jump == 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should rep   lace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
