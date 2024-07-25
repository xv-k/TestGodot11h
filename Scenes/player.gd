extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 200.0
var orientation = [0,0]

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up","down")
	get_orientation(direction)
	
	position += direction * SPEED * delta
	print(direction)
	print(orientation)
	if (orientation[0] == 0 and orientation[1] == 1):
		animated_sprite.play("idle_front")
	if (orientation[0] == 0 and orientation[1] == -1):
		animated_sprite.play("idle_back")
	if (orientation[0] == 1 and orientation[1] == 0):
		animated_sprite.flip_h = false
		animated_sprite.play("idle_side")
	if (orientation[0] == -1 and orientation[1] == 0):
		animated_sprite.flip_h = true
		animated_sprite.play("idle_side")
	
	if (Input.is_action_just_pressed("shoot")):
		print("shoot")
	if (Input.is_action_just_pressed("reload")):
		print("reload")

	move_and_slide()
	
func get_orientation(direction:Vector2):
	if (Input.is_anything_pressed()):
		orientation = direction
