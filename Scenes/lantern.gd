extends StaticBody2D

func _on_area_2d_area_entered(area):
	print("break")
	$PointLight2D.enabled = false


func _on_area_2d_body_entered(body):
	$PointLight2D.enabled = true
