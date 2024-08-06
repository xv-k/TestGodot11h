extends StaticBody2D


func _on_area_2d_area_entered(area):
	print("swing")
	if $AnimationPlayer.is_playing(): $AnimationPlayer.stop()
	$AnimationPlayer.play("swing")
