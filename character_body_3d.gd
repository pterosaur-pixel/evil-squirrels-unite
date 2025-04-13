extends CharacterBody3D
var speed = 30
func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 3
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_z := Input.get_axis("ui_up", "ui_down")
	velocity.z = direction_z * speed
	velocity.x = direction * speed
	if Input.is_action_just_pressed("jump"):
		velocity.y = 50
	move_and_slide()
	print(global_position)
func _on_water_collider_area_entered(area: Area3D) -> void:
	speed = 15

func _on_water_collider_area_exited(area: Area3D) -> void:
	speed = 30
