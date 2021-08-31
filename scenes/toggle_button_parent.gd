extends Control

export (SpriteFrames)var icon_picture
onready var theme_mode = "Light mode" setget set_theme
signal changeThemeRequest(theme_mode)

func _ready():
	$toggle_button/clip_rect/AnimatedSprite.frames = icon_picture

func set_theme(new_theme):
	$toggle_button.theme_mode = new_theme

func _on_toggle_button_pressed():
	if $toggle_button.theme_mode == "Dark mode":
		emit_signal("changeThemeRequest", "Light mode")
	else:
		emit_signal("changeThemeRequest", "Dark mode")
