extends RigidBody3D
class_name Tether


@export var body_a: PlayerRigidBody
@export var body_b: PlayerRigidBody

@export var max_length := 5.0
@export var stiffness := 40.0
@export var damping := 6.0

@export var air_tank_max_velocity: float
@export var tube_length: float = 2.0

@onready var tube_1: Node3D = $Tube1
@onready var tube_2: Node3D = $Tube2


func _physics_process(delta: float) -> void:
	var dir := body_b.global_position - body_a.global_position
	var distance := dir.length()

	global_basis = Basis.looking_at(dir.cross(Vector3.UP), Vector3.UP)

	tube_1.look_at(body_a.l_pipe_rotate_point.global_position)
	tube_1.scale.z = tube_1.global_position.distance_to(body_a.l_pipe_rotate_point.global_position) / tube_length
	tube_2.look_at(body_b.l_pipe_rotate_point.global_position)
	tube_2.scale.z = tube_2.global_position.distance_to(body_b.l_pipe_rotate_point.global_position) / tube_length
	
	body_a.l_pipe_rotate_point.global_basis = Basis.looking_at((global_position - body_a.global_position).cross(Vector3.UP), Vector3.UP)
	body_b.l_pipe_rotate_point.global_basis = Basis.looking_at((global_position - body_b.global_position).cross(Vector3.UP), Vector3.UP)

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


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var middle_position := (body_b.l_pipe_rotate_point.global_position + body_a.l_pipe_rotate_point.global_position) / 2.0
	var vel := (middle_position - global_position) / get_physics_process_delta_time()
	vel = vel.limit_length(air_tank_max_velocity)
	state.linear_velocity = vel
	state.angular_velocity = Vector3.ZERO
