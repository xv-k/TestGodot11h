extends CharacterBody2D


@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 35.0
var orientation:String

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	#position += direction * SPEED * delta
	velocity = direction * SPEED
	print(velocity)
	
	set_animation_orientation(direction)
	
	if (Input.is_action_just_pressed("shoot")):
		print("shoot")
	if (Input.is_action_just_pressed("reload")):
		print("reload")

	move_and_slide()
	
#orientation will be done by mouse (movement shoeld not affect animation)
#idle should change to walking animation
func set_animation_orientation(direction:Vector2):
	if velocity.x < 0:
		orientation = "left"
		animated_sprite.flip_h = true
		animated_sprite.play("walk_side")
	if velocity.x > 0: 
		orientation = "right"
		animated_sprite.flip_h = false
		animated_sprite.play("walk_side")
	if velocity.y > 0: 
		orientation = "down"
		animated_sprite.play("walk_front")
	if velocity.y < 0: 
		orientation = "up"
		animated_sprite.play("walk_back")
		
	#if (direction[0] == 0 and direction[1] == 1):
		#animated_sprite.play("walk_front")
#
	#if (direction[0] == 0 and direction[1] == -1):
		#animated_sprite.play("walk_back")
	#if (direction[0] == 1 and direction[1] == 0):
		#animated_sprite.flip_h = false
		#animated_sprite.play("walk_side")
	#if (direction[0] == -1 and direction[1] == 0):
		#animated_sprite.flip_h = true
		#animated_sprite.play("walk_side")
#else:
	#if (direction[0] == 0 and direction[1] == 1):
		#animated_sprite.play("idle_front")
	#if (direction[0] == 0 and direction[1] == -1):
		#animated_sprite.play("idle_back")
	#if (direction[0] == 1 and direction[1] == 0):
		#animated_sprite.flip_h = false
		#animated_sprite.play("idle_side")
	#if (direction[0] == -1 and direction[1] == 0):
		#animated_sprite.flip_h = true
		#animated_sprite.play("idle_side")
		#implement this
		#if velocity.x < 0: direction = “left”
#elif velocity.x > 0: direction = “right”
#elif velocity.y > 0: direction = “down”
#elif velocity.y < 0: direction = “up”
