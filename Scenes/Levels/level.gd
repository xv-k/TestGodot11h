extends Node2D

var money = 0
var life = 100
var bullet_scene: PackedScene = preload("res://Scenes/bullet.tscn")

func _on_bag_of_money_player_entered(_body):
	money += 100
	print(str(money) + "$")


func _on_player_shoot_bullet(nozzle_marker):
	var bullet = bullet_scene.instantiate()
	$Bullets.add_child(bullet)
	#bullet.direction = shot_direction
	#works with the nozzle rotation (the rotation is to rotate the bullet)
	bullet.direction = Vector2.UP.rotated(nozzle_marker.rotation)
	bullet.global_position = nozzle_marker.global_position
	bullet.rotation = nozzle_marker.rotation


	


func _on_cactus_cactus_sting():
	life -= 1
	var hit = Color(179, 56, 31, 104)
	
	#var zoom_tween = get_tree().create_tween()
	#no need to get the tree
	var zoom_tween = create_tween()
	# is to play the tweens at the same time
	#zoom_tween.set_parallel(false)
	
	#zoom_tween.tween_property($Player,"modulate", Color(1, 0, 0), 0.1)
	#zoom_tween.tween_property($Player,"modulate", Color(1, 1, 1), 0.1)
	#the two lines of code above are the same as the one line below
	#(tween starts from and goes to a value in one line)
	zoom_tween.tween_property($Player,"modulate", Color(1, 1, 1), 0.2).from(Color(1,0,0))
	
	#zoom_tween.tween_property($Player,"modulate", Color(1, 1, 1, 1), 0.1)
	#zoom_tween.tween_property($Player/Camera2D,"zoom", Vector2(3,3), 0.5)
	print(str(life))
