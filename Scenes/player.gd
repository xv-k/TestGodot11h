extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 200.0
var orientation = [0,0]

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up","down")
	position += direction * SPEED * delta
	set_animation_orientation(direction)
	
	if (Input.is_action_just_pressed("shoot")):
		print("shoot")
	if (Input.is_action_just_pressed("reload")):
		print("reload")

	move_and_slide()
	
#orientation will be done by mouse (movement shoeld not affect animation)
#idle should change to walking animation
func set_animation_orientation(direction:Vector2):
	if (direction[0] == 0 and direction[1] == 1):
		animated_sprite.play("idle_front")
	if (direction[0] == 0 and direction[1] == -1):
		animated_sprite.play("idle_back")
	if (direction[0] == 1 and direction[1] == 0):
		animated_sprite.flip_h = false
		animated_sprite.play("idle_side")
	if (direction[0] == -1 and direction[1] == 0):
		animated_sprite.flip_h = true
		animated_sprite.play("idle_side")
	if (direction[0] > 0 and direction[1] > 0):
		animated_sprite.flip_h = false
		animated_sprite.play("idle_front_angle")
		
	
