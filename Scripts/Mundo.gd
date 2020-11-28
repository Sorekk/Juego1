extends Node2D

const monedaNode = preload("res://Scenes/Moneda.tscn")

onready var jugador1 = $jugador1
onready var jugador2 = $jugador2
onready var numeros1 = $Numeros1.animationPlayer
onready var numeros2 = $Numeros2.animationPlayer

var new_moneda: = monedaNode.instance()

func _ready():
	new_moneda.global_position = get_node("/root/Global")._get_random_spawn_position()
	add_child(new_moneda)

func _process(delta):
	print('_process')
	var toca = new_moneda.get('toca')
	var tocaBloque = new_moneda.get('tocaBloque')

	if(toca):
		new_moneda.global_position = get_node("/root/Global")._get_random_spawn_position()
		new_moneda.visible = false
		print('no se ve')
	else:
		new_moneda.visible = true
		print('si se ve')

	numeros1.play('Contar')
	numeros1.seek(jugador1.contadorMonedas, true)
	numeros2.play('Contar')
	numeros2.seek(jugador2.contadorMonedas, true)

	if(jugador1.contadorMonedas == 10):
		get_node("/root/Global").winner = 1
		get_tree().change_scene("res://Scenes/Mundo2.tscn")
	elif(jugador2.contadorMonedas == 10):
		get_node("/root/Global").winner = 2
		get_tree().change_scene("res://Scenes/Mundo2.tscn")
