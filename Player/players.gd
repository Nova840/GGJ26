extends Node
class_name Players


static var instance: Players


@export var starting_oxygen_time: float
@export var damaged_oxygen_time_loss: float
@export var damage_cooldown: float

@onready var tether: Tether = $Tether

var time_last_damaged: float = -INF

var oxygen_time: float
var players_array: Array[PlayerRigidBody]
var oxygen_depleted: bool = false


func _enter_tree() -> void:
	instance = self


func _ready() -> void:
	oxygen_time = starting_oxygen_time
	for child in get_children():
		if child is PlayerRigidBody:
			players_array.append(child)


func _process(delta: float) -> void:
	oxygen_time -= delta
	oxygen_time = max(oxygen_time, 0)
	if oxygen_time <= 0 and not oxygen_depleted:
		oxygen_depleted = true
		print("Lose")


func _on_body_entered(body: Node, sender: NodePath) -> void:
	var current_time := Time.get_ticks_msec() / 1000.0
	if current_time - time_last_damaged >= damage_cooldown and body.get_parent() is not Players:
		time_last_damaged = current_time
		oxygen_time -= damaged_oxygen_time_loss


func get_distance_of_tank() -> float:
	return maxf(-tether.global_position.z, 0)
