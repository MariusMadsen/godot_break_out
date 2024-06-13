extends Node2D

@onready var paddle = $Paddle
@onready var ball = $Ball
@onready var bricks = $Bricks
@onready var brick_scene = preload("res://scenes/brick.tscn")
var ballShot = false

const BRICK_SIZE = Vector2(160, 70)

func _ready():
	build_the_wall()
		
func build_the_wall():
	for j in range(10):
		
		var is_even = j%2 == 0
		var i_range = 11
		if (is_even):
			i_range = 12
		
		var x_offset = 80
		if (is_even):
			x_offset = 0
			 
		for i in range(i_range) :
			
			var instance = brick_scene.instantiate()
			instance.position = Vector2((80 + x_offset) + (i*160), 35+(70*j))
			bricks.add_child(instance)
	

func _physics_process(delta):
	if (!ballShot):
		ball.position = paddle.position + Vector2(0, -25)


func _on_paddle_shoot():
	ballShot = true
	ball.shoot(paddle.velocity)
