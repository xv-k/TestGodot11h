extends Node2D
class_name ParentLevel

@onready var money_ui = $UI_test/VBoxContainer/Label
@onready var life_ui = $UI_test/VBoxContainer/Label2
@onready var life_bar = $UI_test/ProgressBar

var bullet_scene: PackedScene = preload("res://Scenes/bullet.tscn")

func _ready():
	money_ui.text = str(GlobalVariables.money) + "$"
	life_ui.text = "Life: " + str(GlobalVariables.life)
	life_bar.value = GlobalVariables.life

func _on_bag_of_money_player_entered(_body):
	GlobalVariables.money += 100
	print(str(GlobalVariables.money) + "$")
	money_ui.text = str(GlobalVariables.money) + "$"

func _on_player_shoot_bullet(nozzle_marker):
	var bullet = bullet_scene.instantiate()
	$Bullets.add_child(bullet)
	#bullet.direction = shot_direction
	#works with the nozzle rotation (the rotation is to rotate the bullet)
	bullet.direction = Vector2.UP.rotated(nozzle_marker.rotation)
	bullet.global_position = nozzle_marker.global_position
	bullet.rotation = nozzle_marker.rotation

func _on_cactus_cactus_sting():
	GlobalVariables.life -= 1
	var hit = Color(179, 56, 31, 104)
	
	#var hit_tween = get_tree().create_tween()
	#no need to get the tree
	var hit_tween = create_tween()
	# is to play the tweens at the same time
	#hit_tween.set_parallel(false)
	
	#hit_tween.tween_property($Player,"modulate", Color(1, 0, 0), 0.1)
	#hit_tween.tween_property($Player,"modulate", Color(1, 1, 1), 0.1)
	#the two lines of code above are the same as the one line below
	#(tween starts from and goes to a value in one line)
	hit_tween.tween_property($Player,"modulate", Color(1, 1, 1), 0.5).from(Color(1,0,0))
	
	
	#hit_tween.tween_property($Player,"modulate", Color(1, 1, 1, 1), 0.1)
	#hit_tween.tween_property($Player/Camera2D,"zoom", Vector2(3,3), 0.5)
	print(str(GlobalVariables.life))
	life_ui.text = "Life: " + str(GlobalVariables.life)
	life_bar.value = GlobalVariables.life



