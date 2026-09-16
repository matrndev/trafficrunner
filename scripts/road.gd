extends Sprite2D

var starting_y: float
@export var max_y: float = 300.0
@export var scroll_speed: float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_y = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += scroll_speed * delta
	if position.y > max_y:
		position.y = starting_y
