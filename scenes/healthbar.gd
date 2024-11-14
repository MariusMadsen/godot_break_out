extends Control

@onready var health_scene = preload("res://scenes/heart.tscn")
var healthbars = []

func _ready():
	for i in range(3) :
			var instance = health_scene.instantiate()
			instance.position = Vector2(1670 + (i*100), 1000)
			add_child(instance)
			healthbars.append(instance)
	

func take_damage():
	var healthbar = healthbars.pop_front()
	healthbar.queue_free()
	
