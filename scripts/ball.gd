extends CharacterBody2D

const SPEED_Y := 50000
const MAX_X_SPEED := 50000.0
var speed_x := 0.0
var x_dir := 0
var y_dir := -1

var shot = false

signal ball_out

func _ready():
	set_speed()

func set_speed():
	speed_x = randf()*MAX_X_SPEED
	x_dir = randi_range(-1,1)
	print(speed_x)

func _physics_process(delta):
	if (!shot):
		return
		
	if (is_on_ceiling()):
		print("glass ceiling?")
		y_dir = 1
	elif (is_on_floor()):
		y_dir = -1
		set_speed()
		
	if (is_on_wall()):
		speed_x *= -1
	velocity = Vector2(speed_x*delta*x_dir, SPEED_Y*delta*y_dir)

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("Collided with: ", collision.get_collider().name)
		var collider = collision.get_collider()
		if (collider.has_method("hit")):
			collider.hit()

	if (position.y > get_viewport_rect().size.y):
		print("Ball is out of bounds")
		shot = false
		ball_out.emit()

func shoot(paddleVelocity):
	shot = true
	if (paddleVelocity.x < 0):
		x_dir = -1
	if (paddleVelocity.x > 0):
		x_dir = 1


