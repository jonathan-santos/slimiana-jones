extends RigidBody

var movement_speed := 10.0
var jump_force := 500.0
var direction := Vector3()

onready var camera := get_viewport().get_camera()

func _physics_process(_delta):
	move()
	jump()
	
func move():
	direction = Vector3()
	
	if Input.is_action_pressed("move_up"):
		direction -= camera.transform.basis.z
	elif Input.is_action_pressed("move_down"):
		direction += camera.transform.basis.z
	
	elif Input.is_action_pressed("move_left"):
		direction -= camera.transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += camera.transform.basis.x
		
	direction.y = 0
	add_central_force(direction * movement_speed)

func jump():
	if Input.is_action_just_pressed("jump"):
		add_central_force(Vector3.UP * jump_force)
