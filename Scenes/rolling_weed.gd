extends RigidBody2D

@onready var sprite_2d = $Sprite2D

func _physics_process(_delta):
	apply_force(Vector2(1,1), Vector2.ZERO)
	sprite_2d.rotation += 0.01
