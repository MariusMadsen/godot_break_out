extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@onready var shader = preload("res://shaders/brick.gdshader")

var h := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	h = randf()
	var color := Color.from_hsv(h, 1, 1, 1)
	sprite_2d.material = ShaderMaterial.new()
	sprite_2d.material.shader = shader
	sprite_2d.material.set("shader_parameter/rgb", Vector3(color.r, color.g, color.b))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (h == 1.0):
		h = 0.0
		
	else:
		h += 0.01
		
	var color := Color.from_hsv(h, 1, 1, 1)
	sprite_2d.material.set("shader_parameter/rgb", Vector3(color.r, color.g, color.b))

func hit():
	queue_free()
