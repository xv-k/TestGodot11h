extends Node2D

var money = 0
var bullet_scene: PackedScene = preload("res://Scenes/bullet.tscn")

func _on_bag_of_money_player_entered(body):
	money += 100
	print(str(money) + "$")


func _on_player_shoot_bullet(nozzle_marker):
	var bullet = bullet_scene.instantiate()
	$Bullets.add_child(bullet)
	bullet.global_position = nozzle_marker.global_position
	bullet.rotation = nozzle_marker.rotation
