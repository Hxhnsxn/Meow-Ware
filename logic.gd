extends Node3D

@export var modules: Array[PackedScene] = []
var num = 30
var rnge = RandomNumberGenerator.new()
var offset = 5

var initObs = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in num:
		spawnModule(n*offset)



func spawnModule(n):
	if initObs > 5:
		rnge.randomize()
		var amnt = rnge.randi_range(0,modules.size()-1)
		var instance = modules[amnt].instantiate()
		instance.position.x = n
		add_child(instance)
	else:
		var instance = modules[0].instantiate()
		instance.position.x = n
		add_child(instance)
		initObs += 1
