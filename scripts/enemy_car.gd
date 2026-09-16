extends CharacterBody2D


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.y += delta * 300
	if position.y > 700:
		queue_free()
