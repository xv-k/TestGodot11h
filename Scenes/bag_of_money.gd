extends StaticBody2D

signal player_entered(body)
# so we can easily set the sprite in the level node (so we dont have to use
# so editable children buit just this variable instead)
@export var sprite_frame = 1

#export value not used anymore -> now random
var rng = RandomNumberGenerator.new()

func _ready():
	var random_sprite = rng.randf_range(1, 3)
	$Sprite2D.frame = random_sprite
	
func _on_area_2d_body_entered(body):
	$Sprite2D.set_frame(0)
	#$Area2D/CollisionShape2D.disabled = true
	# set_deffered is used so that the physics calculation is done first and after that we disable teh collisionshape
	$Area2D/CollisionShape2D.set_deferred("disabled", true) 
	player_entered.emit(body)


func _on_mouse_entered():
	print("bag of money")
