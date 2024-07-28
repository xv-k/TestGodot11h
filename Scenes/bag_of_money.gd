extends StaticBody2D

signal player_entered(body)

func _on_area_2d_body_entered(body):
	$Sprite2D.set_frame(0)
	$Area2D/CollisionShape2D.disabled = true
	player_entered.emit(body)
