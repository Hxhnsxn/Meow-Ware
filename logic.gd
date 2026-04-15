extends Node3D

@export var modules: Array[PackedScene] = []
@export var obstacles: Array[PackedScene] = []
var num = 30
var rnge = RandomNumberGenerator.new()
var offset = 5

var initObs = 0
var obs_count = 0
var MAX_OBS = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in num:
		spawnModule(n*offset)

func spawnModule(n):
	if initObs > 5:
		rnge.randomize()
		var amnt = rnge.randi_range(0,modules.size()-1)
		var module = modules[amnt]
		var instance = module.instantiate()		
		instance.position.x = n
		add_child(instance)		
		
		if rnge.randf() > 0.5 and obs_count < MAX_OBS:
			spawnObstacle(n)
	else:
		var instance = modules[0].instantiate()
		instance.position.x = n
		add_child(instance)
		initObs += 1
	
func spawnObstacle(x):
		var obs_instance = obstacles[0].instantiate()
		obs_instance.position.x = x
		obs_instance.position.y += 1.75
		obs_count += 1
		obs_instance.tree_exited.connect(_on_obs_freed)
		add_child(obs_instance)
		
func _on_obs_freed():
	obs_count -= 1
