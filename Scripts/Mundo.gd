extends Node2D

const monedaNode = preload("res://Scenes/Moneda.tscn")
const rect_size_x = 1024
const rect_size_y = 600

onready var jugador1 = $Jugador1
onready var jugador2 = $Jugador2
onready var numeros1 = $Numeros1.animationPlayer
onready var numeros2 = $Numeros2.animationPlayer

var new_moneda: = monedaNode.instance()

func _ready():
	new_moneda.global_position = _get_random_spawn_position()
	add_child(new_moneda)

func _process(delta):
	var toca = new_moneda.get('toca')
	if(toca):
		new_moneda.set('toca', false)
		new_moneda.global_position = _get_random_spawn_position()
		add_child(new_moneda)

	numeros1.play('Contar')
	numeros1.seek(jugador1.contadorMonedas, true)
	numeros2.play('Contar')
	numeros2.seek(jugador2.contadorMonedas, true)

	if(jugador1.contadorMonedas == 1):
		var ganador = 1
		get_tree().change_scene("res://Scenes/Mundo2.tscn")
	elif(jugador2.contadorMonedas == 1):
		var ganador = 2
		get_tree().change_scene("res://Scenes/Mundo2.tscn")

func _get_random_spawn_position() -> Vector2:
	var spawn_pos: = Vector2(
	rand_range(0, rect_size_x),
	rand_range(0, rect_size_y))
	return spawn_pos
