extends RigidBody

var direction := Vector3()
var movement_speed := 10.0
var jump_force := 500.0
var impulse_force := 3000.0
var is_colliding := false

onready var camera := get_viewport().get_camera()

func _physics_process(_delta):
	move()
	jump()
	impulse()
	
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
	if Input.is_action_just_pressed("jump") and is_colliding:
		add_central_force(Vector3.UP * jump_force)

func impulse():
	if Input.is_action_just_pressed("impulse") and is_colliding:
		add_central_force(direction * impulse_force)

func _on_SlimianaJones_body_entered(body):
	if body.is_in_group("solid"):
		is_colliding = true

func _on_SlimianaJones_body_exited(body):
	if body.is_in_group("solid"):
		is_colliding = false
