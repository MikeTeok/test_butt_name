extends TextureButton

onready var icon = $clip_rect/AnimatedSprite
onready var animation = $AnimationPlayer
onready var themeAnimation = $ChangeThemeAnimation
onready var shadow = $shadow
onready var theme_mode = "Light mode" setget set_theme
onready var toggle = true setget set_toggle
onready var icon_end_of_animation = icon_selector[!toggle][1]
const icon_selector = {true: [0, 1], false: [2, 3]}
const shadow_selector = {"Light mode": [0, 1], "Dark mode": [2, 3]}
export (SpriteFrames)var icon_picture

# Called when the node enters the scene tree for the first time.
func _ready():
	icon.frames = icon_picture
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
		themeAnimation.play("change_to_dark")
	else:
		themeAnimation.play("change_to_light")

func set_toggle(new_bool):
	toggle = new_bool
	icon.frame = icon_selector[toggle][0]
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	toggle = !toggle
	icon.frame = icon_end_of_animation
	icon_end_of_animation = icon_selector[!toggle][1]
	set_disabled(false)

func _on_toggle_button_pressed():
	set_disabled(true)
