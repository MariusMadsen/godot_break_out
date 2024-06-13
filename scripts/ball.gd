extends CharacterBody2D

const SPEED_Y := 100000
const MAX_X_SPEED := 50000.0
var speed_x := 0.0
var x_dir := 0
var y_dir := -1

var shot = false

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
	
	

func shoot(paddleVelocity):
	shot = true
	if (paddleVelocity.x < 0):
		x_dir = -1
	if (paddleVelocity.x > 0):
		x_dir = 1


