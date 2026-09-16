extends CharacterBody2D

@export var lane_change_speed: float = 600.0
@export var lane_width: float = 130.0

var current_lane: int = 1
var max_lanes: int = 2
var car_x: float

func _ready() -> void:
	car_x = position.x

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		if current_lane <= 0:
			current_lane = 0
		else:
			current_lane = current_lane - 1
			car_x = car_x - lane_width
		
	if Input.is_action_just_pressed("move_right"):
		if current_lane >= max_lanes:
			current_lane = max_lanes
		else:
			current_lane = current_lane + 1
			car_x = car_x + lane_width
	
	position.x = move_toward(position.x, car_x, lane_change_speed * delta)
		
