extends Camera3D
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("camera_left"):
		rotation.y += 0.01
	if Input.is_action_pressed("camera_right"):
		rotation.y -= 0.01
