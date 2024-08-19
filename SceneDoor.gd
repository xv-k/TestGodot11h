extends Area2D

#this is not working for cyclic levels (A --> B and B --> A)
#@export var level: PackedScene

#maybe put the enums (or the strings) in a onther script not the door?
@export_enum("Level 2", "Level 3", "Level 4") var level_to_load: int
var level_path: String

func _ready():
	#choose level
	if level_to_load == 0:
		level_path = "res://Scenes/Levels/level_2.tscn"
	elif level_to_load == 1:
		level_path = "res://Scenes/Levels/level_3.tscn"
	elif level_to_load == 2:
		level_path = "res://Scenes/Levels/level_4.tscn"
	
func _on_body_entered(_body):
	#uses a fucntion in an global scene that has an animation and then chenges the scene in there
	TransitionLayer.scene_transition(level_path)
	#get_tree().change_scene_to_file.call_deferred(level_path)
	#get_tree().unload_current_scene.call_deferred()
	#get_tree().change_scene_to_packed.call_deferred(level)
