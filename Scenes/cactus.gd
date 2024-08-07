extends StaticBody2D

signal cactus_sting

func _on_area_2d_body_entered(_body):
	cactus_sting.emit()
	
