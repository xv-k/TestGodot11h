extends Area2D

@export var speed: int = 100
var direction: Vector2

func _ready():
	#when bullet is created, start the timer
	$Timer.start()
	
func _process(delta):
	#direction is set in level when the bullet is instantiated
	position += direction * speed * delta

func _on_timer_timeout():
	#when timer runs out, delete the bullet
	queue_free()
