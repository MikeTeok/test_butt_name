extends AnimatedSprite

func _ready():
	frame = 0 
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
