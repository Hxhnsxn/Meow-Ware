extends Sprite3D

var coins = 5 # holds int value to descirbe the number of coins
var player_name = "robot" # hold str value to descibe the texture of the coin
var hearts = 3.5 # hold floar alue for the amount of lives it has
const SPEED = 2 # immutable int to describe the speed
var x = coins + SPEED
var is_godot_awesome = true
var is_key_collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(add_these_numebrs(5, 6))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#minion()
	process_inputs()
	pass
	

func minion():
	print("BANANA!")

func add_these_numebrs(x: int, y: int):
	var sum = x + y
	return sum
	
func process_inputs() -> void:
	if Input.is_action_pressed("ui_left"):
		rotate_y(deg_to_rad(-SPEED))
	elif Input.is_action_pressed("ui_right"):
		rotate_y(deg_to_rad(SPEED))
