extends Node3D
class_name Tether


@export var body_a: RigidBody3D
@export var body_b: RigidBody3D

@export var max_length := 5.0
@export var stiffness := 40.0
@export var damping := 6.0

func _physics_process(delta: float) -> void:
	var dir = body_b.global_position - body_a.global_position
	var distance = dir.length()

	if distance <= max_length:
		return  # slack, no force (rubber band not stretched)

	var direction = dir / distance
	var stretch = distance - max_length

	# Hooke's law: F = -kx
	var spring_force = stiffness * stretch

	# Damping along the spring axis
	var rel_vel = body_b.linear_velocity - body_a.linear_velocity
	var damping_force = rel_vel.dot(direction) * damping

	var force = (spring_force + damping_force) * direction

	body_a.apply_central_force(force)
	body_b.apply_central_force(-force)
