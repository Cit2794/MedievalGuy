extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout") #espera hasta la señal (en este caso que se termine de mostrar el mensaje)
	$ButtonPlay.show()
	$Mensaje.text = "Medieval Guy"
	$Mensaje.show()

func update_score(Score):
	$ScoreLabel.text = str(Score) #convierte a string


func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_ButtonPlay_pressed():
	$ButtonPlay.hide()
	emit_signal("iniciar_juego")
