extends CharacterBody2D

@onready var timer = $AnimatedSprite2D/Timer

signal shoot_bullet(nozzle_marker)

@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 35.0
var last_movement:String = "front"
var last_flip:bool = false
var shoot: bool = false

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	#position += direction * SPEED * delta
	
	#look_at(get_global_mouse_position())
	
	velocity = direction * SPEED
	#print(velocity)
	
	set_animation_orientation(direction)
	
	#shoot animation is not working properly
	
	if (Input.is_action_just_pressed("shoot") and !shoot):
		var nozzle_marker = select_nozzle(last_flip, last_movement)
		# direction was also emitted but it can also be calculated by angle of the nozzle
		# so this is not needed anymore
		# var shot_direction = calculate_direction(last_flip, last_movement)
		shoot_bullet.emit(nozzle_marker)
		
		animated_sprite.flip_h = last_flip
		animated_sprite.play("shoot_" + last_movement)
		shoot = true
		# timer is for between shots (it limits the amount of shots, buit is actually so that
		# the shot animation is played entirely :)
		timer.start()
		
		
	if (Input.is_action_just_pressed("reload")):
		print("reload")

	#make it so you cant move while shooting
	if !shoot:
		move_and_slide()

func _on_timer_timeout():
	shoot = false
	
func set_animation_orientation(direction:Vector2):
	if !shoot :
		# play animtion depending on velocity values
		# and save the orinetation in last_movement and last_flip
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
		# if there is no velocity, then the idle animation should be played
		# but the idle animation has to be that one from the last orientation in the correct flip_h position
		if velocity.x == 0 and velocity.y == 0:
			animated_sprite.flip_h = last_flip
			animated_sprite.play("idle_" + last_movement)
	
#to select a nozzle marker pased on orientation of the palyer and if it is flipped or not			
func select_nozzle(flip:bool, orientation:String) -> Marker2D:
	if !flip and orientation == "back":
		return $BulletPositions/back
	if !flip and orientation == "front":
		return $BulletPositions/front
	if !flip and orientation == "front_angle":
		return $BulletPositions/front_angle
	if flip and orientation == "front_angle":
		return $BulletPositions/flipped_front_angle
	if !flip and orientation == "back_angle":
		return $BulletPositions/back_angle
	if flip and orientation == "back_angle":
		return $BulletPositions/flipped_back_angle
	if !flip and orientation == "side":
		return $BulletPositions/side
	if flip and orientation == "side":
		return $BulletPositions/flipped_side
	else:
		return $BulletPositions/front

# we dont need this any more
# this was to calculate a direction and return a vector
# but we use the rotation of the different Marker2D's
# because we emit the marker when the bullet is created, we can also get the rotation of thazt marker
# and set is as rotation of the bullet

#func calculate_direction(flip:bool, orientation:String) -> Vector2:
	#if !flip and orientation == "back":
		#return Vector2.UP
	#if !flip and orientation == "front":
		#return Vector2.DOWN
	#if !flip and orientation == "front_angle":
		#return Vector2.from_angle(PI/4)
	#if flip and orientation == "front_angle":
		#return Vector2.from_angle(3*PI/4)
	#if !flip and orientation == "back_angle":
		#return Vector2.from_angle(-PI/4)
	#if flip and orientation == "back_angle":
		#return Vector2.from_angle(-3*PI/4)
	#if !flip and orientation == "side":
		#return Vector2.RIGHT
	#if flip and orientation == "side":
		#return Vector2.LEFT
	#else:
		#return Vector2.ZERO
	



