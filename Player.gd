extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal touched #Bandera de gameover

func _ready():
	hide()
	limite = get_viewport_rect().size

func _process(delta): #delta es la velocidad en tiempo real del pc
	Movimiento = Vector2() #limpiar variable
	
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Movimiento.length() > 0: #Verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la velocidad
	
	position += Movimiento * delta
	position.x = clamp(position.x, 0, limite.x)#clamp encapsula la posición en los limites 0 y el maximo en x
	position.y = clamp(position.y, 0, limite.y)#clamp encapsula la posición en los limites 0 y el maximo en y

	if Movimiento.x != 0:
		$Sprite_player.animation = "Run"
		$Sprite_player.flip_h = Movimiento.x > 0
	elif Movimiento.y < 0:
		$Sprite_player.animation = "Up"
	elif Movimiento.y > 0:
		$Sprite_player.animation = "Down"
	else:
		$Sprite_player.animation = "Idle"

func _on_Player_body_entered(body): #Game Over
	hide()
	emit_signal("touched") #emite la señal (bandera)
	$CollisionShape2D.disabled = true

func inicio(pos): #Iniciar el juego
	position = pos
	show()
	$CollisionShape2D.disabled = false
