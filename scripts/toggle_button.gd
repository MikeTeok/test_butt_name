extends TextureButton

onready var icon = $clip_rect/AnimatedSprite
onready var animation = $AnimationPlayer
onready var shadow = $shadow
onready var theme_mode = "Light mode" setget set_theme
onready var toggle = true
onready var icon_end_of_animation = icon_selector[!toggle][1]
const icon_selector = {true: [0, 1], false: [2, 3]}
const shadow_selector = {"Light mode": [0, 1], "Dark mode": [2, 3]}

# Called when the node enters the scene tree for the first time.
func _ready():
	icon.frame = icon_selector[toggle][0]
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_mouse_entered():
	if animation.is_playing():
		icon_end_of_animation = icon_selector[!toggle][1]
		return
	icon.frame = icon_selector[toggle][1] 
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_button_up():
	if animation.is_playing():
		return
	var anim_type = "goto_right" if toggle else "goto_left"
	animation.play(anim_type)
	icon.frame = icon_selector[toggle][1]
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func _on_button_button_down():
	if animation.is_playing():
		return
	icon.frame = icon_selector[toggle][0]
	shadow.frame = shadow_selector[theme_mode][1]
	shadow.show_behind_parent = false

func _on_button_mouse_exited():
	if animation.is_playing():
		icon_end_of_animation = icon_selector[!toggle][0]
		return
	icon.frame = icon_selector[toggle][0]
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true

func set_theme(new_theme):
	theme_mode = new_theme
	shadow.frame = shadow_selector[theme_mode][0]
	shadow.show_behind_parent = true
	if new_theme == "Dark mode":
		self.self_modulate = Color("2A2A2A")
	else:
		self.self_modulate = Color("D6FFFF")

func _on_AnimationPlayer_animation_finished(_anim_name):
	toggle = !toggle
	icon.frame = icon_end_of_animation
	icon_end_of_animation = icon_selector[!toggle][1]
