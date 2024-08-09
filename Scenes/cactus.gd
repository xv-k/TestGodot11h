extends StaticBody2D

signal cactus_sting
signal cactus_hit

func _on_area_2d_body_entered(_body):
	cactus_sting.emit()
	cactus_hit.emit()
	
