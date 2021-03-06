extends Node2D

const monedaNode = preload("res://Scenes/Moneda.tscn")
const rect_size_x = 1024
const rect_size_y = 600

onready var jugador1 = $jugador1
onready var jugador2 = $jugador2
onready var numeros1 = $Numeros1.animationPlayer
onready var numeros2 = $Numeros2.animationPlayer

var new_moneda: = monedaNode.instance()

func _ready():
	new_moneda.global_position = get_node("/root/Global")._get_random_spawn_position()
	add_child(new_moneda)

func _process(delta):
	var toca = new_moneda.get('toca')
	if(toca):
		new_moneda.set('toca', false)
		new_moneda.global_position = get_node("/root/Global")._get_random_spawn_position()
		add_child(new_moneda)

	numeros1.play('Contar')
	numeros1.seek(jugador1.contadorMonedas, true)
	numeros2.play('Contar')
	numeros2.seek(jugador2.contadorMonedas, true)

	if(jugador1.contadorMonedas == 10):
		get_node("/root/Global").winner = 1
		get_tree().change_scene("res://Scenes/Ganador.tscn")
	elif(jugador2.contadorMonedas == 10):
		get_node("/root/Global").winner = 2
		get_tree().change_scene("res://Scenes/Ganador.tscn")
