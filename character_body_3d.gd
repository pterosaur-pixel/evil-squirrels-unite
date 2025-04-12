extends CharacterBody3D
func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 5
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_z := Input.get_axis("ui_up", "ui_down")
	velocity.z = direction_z * 30
	velocity.x = direction * 30
	if Input.is_action_just_pressed("jump"):
		velocity.y += 50
		
	move_and_slide()
