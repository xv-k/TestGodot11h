extends StaticBody2D

signal player_entered(body)
# so we can easily set the sprite in the level node (so we dont have to use
# so editable children buit just this variable instead)
@export var sprite_frame = 1

func _ready():
	$Sprite2D.frame = sprite_frame
	
func _on_area_2d_body_entered(body):
	$Sprite2D.set_frame(0)
	#$Area2D/CollisionShape2D.disabled = true
	# set_deffered is used so that the physics calculation is done first and after that we disable teh collisionshape
	$Area2D/CollisionShape2D.set_deferred("disabled", true) 
	player_entered.emit(body)


func _on_mouse_entered():
	print("bag of money")
