extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
#array de sprites para cambiar entre tamaños
#var tipo_roca = ["grande", "chiquito"]

func _ready():
#	Inicializa la animacion con un sprite aleatorio
#	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	
	#Cambiando el tamaño de la collision para que se ajuste al sprite grande
#	if $AnimatedSprite.animation == "grande":
#		$CollitionShape2D.scale.x = 1.5
#		$CollitionShape2D.scale.y = 1.5
	pass


func _on_Visibilidad_screen_exited():
	queue_free() #Elimina el monstruo
