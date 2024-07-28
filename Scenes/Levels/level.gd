extends Node2D

var money = 0
var bullet_scene: PackedScene = preload("res://Scenes/bullet.tscn")

func _on_bag_of_money_player_entered(body):
	money += 100
	print(str(money) + "$")


func _on_player_shoot_bullet():
	#var bullet = bullet_scene.instantiate()
	#bullet.position = $Player.position
	#add_child(bullet)
	print("bullet shot from player in level")
