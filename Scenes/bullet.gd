extends Area2D


var speed: int = 500
var direction: Vector2

func _ready():
	#looking for a way to get the shoot direction from the player or the level in the bullet
	#second signal in player (one goes to the level) that goes to the bullet??
	direction = Vector2.UP

func _process(delta):
	#position += direction * speed * delta
	pass
