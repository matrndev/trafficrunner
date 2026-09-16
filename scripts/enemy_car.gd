extends CharacterBody2D

signal passed
signal crashed

var speed = randi_range(250, 900)

func _ready() -> void:
	var random = randi_range(1, 138)
	$Sprite2D.texture = load("res://assets/TopDown Vehicles/other_cars/" + str(random) + ".png")

func _physics_process(delta: float) -> void:
	position.y += delta * speed
	if position.y > 700:
		passed.emit()
		queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerCar":
		crashed.emit()
	if body.name.begins_with("EnemyCar") and not body == self:
		queue_free()
