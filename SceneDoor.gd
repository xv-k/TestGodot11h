extends Area2D

@export var level: PackedScene

func _on_body_entered(_body):
	#get_tree().change_scene_to_file.call_deferred("res://Scenes/Levels/level_3.tscn")
	get_tree().unload_current_scene.call_deferred()
	get_tree().change_scene_to_packed.call_deferred(level)
