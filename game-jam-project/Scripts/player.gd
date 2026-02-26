extends CharacterBody2D

@onready var animated_sprite=$AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
<<<<<<< Updated upstream
<<<<<<< HEAD
const no_JUMP_VELOCITY = 0

var on_floor = 1
=======
>>>>>>> 76427025877d032179d965d747406a4b76759e4c
=======
var facing_right := true
>>>>>>> Stashed changes


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

<<<<<<< Updated upstream
<<<<<<< HEAD
	# Handle jump.
	if Input.is_action_just_pressed("jump") == 1:
		velocity.y = JUMP_VELOCITY
		print("jump")
		time_jump - 1
		if time_jump == 0:
			velocity.y = no_JUMP_VELOCITY
			velocity.y= JUMP_VELOCITY
			time_jump == 1
=======
=======
	var direction_x := Input.get_axis("left", "right")
>>>>>>> Stashed changes

>>>>>>> 76427025877d032179d965d747406a4b76759e4c

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should rep  lace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction_x != 0:
		facing_right = direction_x > 0
		animated_sprite.flip_h = not facing_right
	
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
