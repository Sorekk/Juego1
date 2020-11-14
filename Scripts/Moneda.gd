extends Area2D

onready var animationPlayer = $AnimationPlayer
var toca = false

func _physics_process(delta):
	animationPlayer.play("Idle")
	
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "jugador1":
			body.contadorMonedas += 1
			get_parent().remove_child(self)
			var puntos = "Jugardor 1: {score}"
			var puntuacion = puntos.format({"score": body.contadorMonedas})
			print(puntuacion)
			toca = true
		elif body.name == "jugador2":
			body.contadorMonedas += 1
			get_parent().remove_child(self)
			var puntos = "Jugardor 2: {score}"
			var puntuacion = puntos.format({"score": body.contadorMonedas})
			print(puntuacion)
			toca = true
