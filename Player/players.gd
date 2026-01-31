extends Node
class_name Players


@export var starting_oxygen_time: float
@export var damaged_oxygen_time_loss: float

@onready var temporary_oxygen_label: Label = $TemporaryOxygenLabel

var oxygen_time: float
var players_array: Array[PlayerRigidBody]
var oxygen_depleted: bool = false


func _ready() -> void:
	oxygen_time = starting_oxygen_time
	for child in get_children():
		if child is PlayerRigidBody:
			players_array.append(child)
	for player in players_array:
		player.player_damaged.connect(_player_damaged)


func _process(delta: float) -> void:
	oxygen_time -= delta
	oxygen_time = max(oxygen_time, 0)
	if oxygen_time <= 0 and not oxygen_depleted:
		oxygen_depleted = true
		print("Lose")
	temporary_oxygen_label.text = "Oxygen: " + str(ceili(oxygen_time)) + "/" + str(ceili(starting_oxygen_time))


func _player_damaged() -> void:
	oxygen_time -= damaged_oxygen_time_loss
