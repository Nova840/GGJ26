extends RigidBody3D
class_name PlayerRigidBody


@export var rocket_strength: float
@export var max_velocity: float
@export var rotate_speed: float

@export var input_left: String
@export var input_right: String
@export var input_up: String
@export var input_down: String
@export var input_add_force: String


func _physics_process(delta: float) -> void:
	var input_vector := Input.get_vector(input_left, input_right, input_down, input_up)
	if input_vector != Vector2.ZERO:
		var target_global_basis = Basis.looking_at(Vector3(input_vector.x, 0, -input_vector.y), Vector3.UP)
		global_basis = global_basis.slerp(target_global_basis.orthonormalized(), rotate_speed * delta)
	var force_strength := Input.get_action_strength(input_add_force)
	apply_central_force(-global_basis.z * (rocket_strength * force_strength))


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if state.linear_velocity.length() > max_velocity:
		state.linear_velocity = state.linear_velocity.normalized() * max_velocity
	state.angular_velocity = Vector3.ZERO
#func _on_body_entered(): print("ASd")
