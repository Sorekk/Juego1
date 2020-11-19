extends Node2D

const rect_size_x = 1024
const rect_size_y = 600
const jugador1 = preload("res://Scenes/jugador1.tscn")
const jugador2 = preload("res://Scenes/jugador2.tscn")

func _ready():
	var new_winner = null
	if(get_node("/root/Global").winner == 1):
		new_winner = jugador1.instance()
	else:
		new_winner = jugador2.instance()
	
	new_winner.global_position = _get_random_spawn_position()
	add_child(new_winner)

func _get_random_spawn_position() -> Vector2:
	var spawn_pos: = Vector2(
	rand_range(0, rect_size_x),
	rand_range(0, rect_size_y))
	return spawn_pos
