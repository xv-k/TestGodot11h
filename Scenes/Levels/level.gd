extends Node2D

var money = 0

func _on_bag_of_money_player_entered(body):
	money += 100
	print(str(money) + "$")
