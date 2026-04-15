extends Node3D
@onready var level = $'../'
var speed = 10 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float):
	animation_player.play("rolling")
	position.x -= speed * delta * 2
	if position.x < -15:
		level.spawnModule(position.x+(level.num * level.offset))
		queue_free()
