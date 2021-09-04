extends AnimatedSprite

onready var piak = $piak

func _ready():
	frame = 0
	piak.visible = false

func _on_HandSlapEffect_animation_finished():
	stop()
	frame = 0


func _on_HandSlapEffect_frame_changed():
	if frame == 2:
		piak.visible = true
	
	if frame == 7:
		piak.visible = false
