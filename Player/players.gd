extends Node
class_name Players


@export var starting_oxygen_time: float
var oxygen_time: float


func _ready() -> void:
	oxygen_time = starting_oxygen_time


func _process(delta: float) -> void:
	oxygen_time -= delta
