extends AnimatedSprite

func _ready():
	frame = 0

func _on_HandSlapEffect_animation_finished():
	stop()
	frame = 0
