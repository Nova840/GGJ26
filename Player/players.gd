extends Node
class_name Players


@export var starting_oxygen_time: float
@export var damaged_oxygen_time_loss: float

var oxygen_time: float
var players_array: Array[PlayerRigidBody]


func _ready() -> void:
	oxygen_time = starting_oxygen_time
	for child in get_children():
		if child is PlayerRigidBody:
			players_array.append(child)
	for player in players_array:
		player.player_damaged.connect(_player_damaged)


func _process(delta: float) -> void:
	oxygen_time -= delta


func _player_damaged() -> void:
	oxygen_time -= damaged_oxygen_time_loss
