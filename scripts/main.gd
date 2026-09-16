extends Node

@export var enemy_car_scene: PackedScene
@export var game_over_scene: PackedScene
var points: int = 0
@export var base_spawn_rate: float = 2.5

func _ready() -> void:
	$EnemyCarSpawnRate.wait_time = base_spawn_rate
	_on_enemy_car_spawn_rate_timeout()

func _on_enemy_car_spawn_rate_timeout() -> void:
	var random = randi() % 3
	var enemy_car = enemy_car_scene.instantiate()
	var target_x: int = 200
	var lane_width: int = 130
	
	if random == 0:
		target_x -= lane_width
	elif random == 1:
		target_x += lane_width
	
	enemy_car.position = Vector2(target_x, -200)
	enemy_car.connect("passed", _on_enemy_passed)
	enemy_car.connect("crashed", _on_enemy_crashed)
	add_child(enemy_car)

func _on_enemy_passed() -> void:
	points += 1
	$PointsLabel.text = str(points)
	
	if $EnemyCarSpawnRate.wait_time > 0.8:
		$EnemyCarSpawnRate.wait_time -= 0.08

func _on_enemy_crashed() -> void:
	var game_over = game_over_scene.instantiate()
	game_over.connect("reset_pressed", reset_game)
	add_child(game_over)
	get_tree().paused = true

func reset_game() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
