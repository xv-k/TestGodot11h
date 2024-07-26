extends CharacterBody2D


@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 35.0
var movement:bool
var last_movement:String = "front"
var last_flip:bool = false

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	#position += direction * SPEED * delta
	if direction == Vector2.ZERO:
		movement = false
	else :
		movement = true
		
	velocity = direction * SPEED
	#print(velocity)
	
	set_animation_orientation(direction)
	
	#shoot animation is not working properly
	if (Input.is_action_just_pressed("shoot")):
		print("shoot_" + last_movement)
		#animated_sprite.stop()
		animated_sprite.flip_h = last_flip
		animated_sprite.play("shoot_" + last_movement)
		
	if (Input.is_action_just_pressed("reload")):
		print("reload")

	move_and_slide()


#orientation will eventually be done by mouse (movement should not affect animation)
func set_animation_orientation(direction:Vector2):
	if velocity.x < 0 and velocity.y == 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walk_side")
		last_movement = "side"
		last_flip = true
	if velocity.x > 0 and velocity.y == 0: 
		animated_sprite.flip_h = false
		animated_sprite.play("walk_side")
		last_movement = "side"
		last_flip = false
	if velocity.x > 0 and velocity.y > 0: 
		animated_sprite.flip_h = false
		animated_sprite.play("walk_front_angle")
		last_movement = "front_angle"
		last_flip = false
	if velocity.x > 0 and velocity.y < 0: 
		animated_sprite.flip_h = false
		animated_sprite.play("walk_back_angle")
		last_movement = "back_angle"
		last_flip = false
	if velocity.x == 0 and velocity.y > 0: 
		animated_sprite.play("walk_front")
		last_movement = "front"
		last_flip = false
	if velocity.x == 0 and velocity.y < 0: 
		animated_sprite.play("walk_back")
		last_movement = "back"
		last_flip = false
	if velocity.x < 0 and velocity.y > 0: 
		animated_sprite.flip_h = true
		animated_sprite.play("walk_front_angle")
		last_movement = "front_angle"
		last_flip = true
	if velocity.x < 0 and velocity.y < 0: 
		animated_sprite.flip_h = true
		animated_sprite.play("walk_back_angle")
		last_movement = "back_angle"
		last_flip = true
	if velocity.x == 0 and velocity.y == 0:
		animated_sprite.flip_h = last_flip
		animated_sprite.play("idle_" + last_movement)
		
