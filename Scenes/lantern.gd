extends StaticBody2D

@export var speed = 0
func _on_area_2d_area_entered(_area):
	print("break")
	$PointLight2D.enabled = false


func _on_area_2d_body_entered(_body):
	$PointLight2D.enabled = true
	
func _process(_delta):
	#to add flickering lights
	if Engine.get_frames_drawn() % randi_range(10,20) == 0:
		$PointLight2D.energy = 1 - randf_range(0, 0.3)
