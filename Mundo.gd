extends Node
export (PackedScene) var Monster
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionDeInicio.position) #Posición de inicio del jugador
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	$Musica.play()

func game_over():
	$ScoreTimer.stop()
	$MonsterTimer.stop()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop()

func _on_InicioTimer_timeout():
	$MonsterTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout(): #Cuando pasa el segundo, suma un punto
	Score += 1
	$Interfaz.update_score(Score)


func _on_MonsterTimer_timeout(): #Cada tiempo configurado creara un nuevo monstruo
	#Seleccionar salida aleatoria del camino creado
	$Camino/MonsterPosition.set_offset(randi())
	
	var M = Monster.instance()
	add_child(M)
	
	#Seleccionar una dirección
	var dir = $Camino/MonsterPosition.rotation + PI/2
	
	M.position = $Camino/MonsterPosition.position
	
	dir += rand_range(-PI/4, PI/4)
	M.rotation = dir
	M.set_linear_velocity(Vector2(rand_range(M.velocidad_min, M.velocidad_max), 0).rotated(dir))
