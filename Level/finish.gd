extends Area3D
class_name Finish


func _on_body_entered(body: Node3D) -> void:
	if body is PlayerRigidBody:
		print("Finish")
