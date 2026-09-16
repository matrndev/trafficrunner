extends CharacterBody2D

signal passed
signal crashed

func _ready() -> void:
	var random = randi_range(1, 138)
	$Sprite2D.texture = load("res://assets/TopDown Vehicles/other_cars/" + str(random) + ".png")

func _physics_process(delta: float) -> void:
	var random = randi_range(250, 900)
	position.y += delta * random
	if position.y > 700:
		passed.emit()
		queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerCar":
		crashed.emit()
