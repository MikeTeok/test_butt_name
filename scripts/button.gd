extends TextureButton

onready var icon = $AnimatedSprite
onready var shadow = $shadow
onready var animation = $ChangeThemeAnimation
export (SpriteFrames)var icon_picture
onready var theme_mode = "Light mode" setget set_theme
const shadow_selector = {"Light mode": [0, 1], "Dark mode": [2, 3]}

# Called when the node enters the scene tree for the first time.
func _ready():
	icon.frames = icon_picture
	icon.frame = 0
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_mouse_entered():
	icon.frame = 1 
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_button_up():
	icon.frame = 1
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_button_down():
	icon.frame = 2 
	shadow.frame = shadow_selector[theme_mode][1]
	shadow.show_behind_parent = false

func _on_button_mouse_exited():
	icon.frame = 0
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func set_theme(new_theme):
	theme_mode = new_theme
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true
	if new_theme == "Dark mode":
		animation.play("change_to_dark")
	else:
		animation.play("change_to_light")

