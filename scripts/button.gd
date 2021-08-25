extends TextureButton

onready var icon = $AnimatedSprite
onready var shadow = $shadow
export (SpriteFrames)var icon_picture

# Called when the node enters the scene tree for the first time.
func _ready():
	icon.frames = icon_picture
	icon.frame = 0
	shadow.visible = true

func _on_button_mouse_entered():
	icon.frame = 1 
	shadow.visible = true

func _on_button_button_up():
	icon.frame = 1
	shadow.visible = true

func _on_button_button_down():
	icon.frame = 2 
	shadow.visible = false

func _on_button_mouse_exited():
	icon.frame = 0
	shadow.visible = true
