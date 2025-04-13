extends CharacterBody3D
var speed = 30
var leg_1_direction = 0.15
var leg_2_direction = -0.15
func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 3
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_z := Input.get_axis("ui_up", "ui_down")
	velocity.z = direction_z * speed
	velocity.x = direction * speed
	if direction != 0:
		rotation.y = -direction * PI/2
	if direction_z != 0:
		if direction_z == -1:
			rotation.y = 0
		else:
			rotation.y = PI
	if Input.is_action_just_pressed("jump"):
		velocity.y = 50
	if velocity.y != 0:
		$Leg1.rotation.x = -PI/2.5
		$Leg2.rotation.x = -PI/2.5
	
	elif direction != 0 or direction_z != 0:
		print('moving')
		if $Leg1.rotation.x > PI/2.9 or $Leg1.rotation.x < -PI/2.5:
			leg_1_direction = -leg_1_direction
		leg_2_direction = -leg_1_direction
		#if $Leg2.rotation.x > PI/2.9 or $Leg2.rotation.x < -PI/2.5:
			#leg_2_direction = -leg_2_direction
		$Leg1.rotation.x += leg_1_direction
		$Leg2.rotation.x += leg_2_direction
	else:
		$Leg1.rotation.x = 0
		$Leg2.rotation.x = 0	
	
	
	
	move_and_slide()	
func _on_water_collider_area_entered(area: Area3D) -> void:
	speed = 15

func _on_water_collider_area_exited(area: Area3D) -> void:
	speed = 30
