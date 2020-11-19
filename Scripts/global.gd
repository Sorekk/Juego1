extends Node

const rect_size_x = 1024
const rect_size_y = 600

onready var winner

func _get_random_spawn_position() -> Vector2:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var spawn_pos: = Vector2(
	rng.randf_range(0, rect_size_x),
	rng.randf_range(0, rect_size_y))
	return spawn_pos
