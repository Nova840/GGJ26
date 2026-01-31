extends Node3D
class_name Tether


@export var body_a: RigidBody3D
@export var body_b: RigidBody3D

@export var max_length := 5.0
@export var stiffness := 40.0
@export var damping := 6.0

@onready var tube_1: Node3D = $Tube1
@onready var tube_2: Node3D = $Tube2


func _physics_process(delta: float) -> void:
	var dir := body_b.global_position - body_a.global_position
	var distance := dir.length()

	var middle_position := (body_b.global_position + body_a.global_position) / 2.0
	global_position = middle_position
	global_basis = Basis.looking_at(dir.cross(Vector3.UP), Vector3.UP)
	
	tube_1.scale.z = distance / 4.0 # half the distance times the tube length (2)
	tube_2.scale.z = distance / 4.0

	if distance <= max_length:
		return

	var direction := dir / distance
	var stretch := distance - max_length

	var spring_force := stiffness * stretch

	var rel_vel := body_b.linear_velocity - body_a.linear_velocity
	var damping_force := rel_vel.dot(direction) * damping

	var force := (spring_force + damping_force) * direction

	body_a.apply_central_force(force)
	body_b.apply_central_force(-force)
