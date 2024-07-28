extends StaticBody2D

signal player_entered(body)
@export var sprite_frame = 1

func _ready():
	$Sprite2D.frame = sprite_frame
	
func _on_area_2d_body_entered(body):
	$Sprite2D.set_frame(0)
	#$Area2D/CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.set_deferred("disabled", true) 
	player_entered.emit(body)
