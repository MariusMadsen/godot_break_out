extends CharacterBody2D


const SPEED = 90000.0
const PADDLE_LENGTH = 160

signal shoot

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction*delta*SPEED
	move_and_slide()
	
	position.x = clamp(position.x, 0 + PADDLE_LENGTH/2, get_viewport_rect().size.x - PADDLE_LENGTH / 2)
	
	position.y = get_viewport_rect().size.y -10
	if (Input.is_action_just_pressed("shoot")):
		shoot.emit()
		
	
