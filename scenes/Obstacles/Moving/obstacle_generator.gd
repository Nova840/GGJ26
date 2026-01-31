extends Node3D

@export var direction = Vector3(1, 0, 0)
@export var speed = 1.0
@export var scenes: Array[PackedScene] = []
@export var delay_seconds = 2

var elapsed = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed = elapsed + delta
	if elapsed > delay_seconds:
		elapsed = 0.0
		shoot_obstacle()

func shoot_obstacle():
	if scenes.is_empty():
		return
	
	var obs: PackedScene = scenes.pick_random()
	var instantiated: RigidBody3D = obs.instantiate()
	add_child(instantiated)
	instantiated.linear_velocity = direction * speed
