extends Node3D
@onready var level = $'../'
var speed = 10 

func _process(delta: float):
	position.x -= speed * delta * 2
	if position.x < -15:
		level.spawnModule(position.x+(level.num * level.offset))
		queue_free()
