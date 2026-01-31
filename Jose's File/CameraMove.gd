extends Node3D

	
var t := 0.0
@onready var path = $Path3D/PathFollow3D
@onready var menu = $CanvasLayer
@onready var button = $CanvasLayer/Button
var paused = true

func _ready():
	button.connect("pressed", Callable(self, "_on_button_pressed"))
func _process(delta: float) -> void:
	delay_title()
	t += delta
	path.progress = t * 35.0
	if (path.progress > 55):
		get_tree().change_scene_to_file("res://Jose's File/PlateformScene.tscn")
func delay_title():
	if paused:
		menu.show()
		Engine.time_scale = 0
	else:
		menu.hide()
		Engine.time_scale = 1
	
func _on_button_pressed():
	print("Button is pressed\n")
	paused = !paused
