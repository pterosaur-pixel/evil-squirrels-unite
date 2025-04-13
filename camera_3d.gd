extends Camera3D
@onready var character = get_node("../GoobleSnoop")
func _physics_process(delta: float) -> void:
	global_position.x = character.global_position.x + 2
	global_position.z = character.global_position.z + 5
	if Input.is_action_pressed("camera_left"):
		rotation.y += 0.01
	if Input.is_action_pressed("camera_right"):
		rotation.y -= 0.01
