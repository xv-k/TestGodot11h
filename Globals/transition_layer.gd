extends CanvasLayer


func scene_transition(target_scene:String):
	$AnimationPlayer.play("transition")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file.call_deferred(target_scene)
	$AnimationPlayer.play_backwards("transition")
	

