extends Control

onready var start_button = $CenterContainer/VBoxContainer/PlayButton
onready var light_mode_button = $CenterContainer/VBoxContainer/LightModeButton
onready var dark_mode_button = $CenterContainer/VBoxContainer/DarkModeButton
signal startRequest
signal changeThemeRequest(theme_mode)
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	pass # Replace with function body.

func set_theme(new_theme):
	theme_mode = new_theme
	start_button.theme_mode = new_theme
	light_mode_button.theme_mode = new_theme
	dark_mode_button.theme_mode = new_theme
	
func _on_PlayButton_pressed():
	emit_signal("startRequest")

func _on_LightModeButton_pressed():
	emit_signal("changeThemeRequest", "Light mode")

func _on_DarkModeButton_pressed():
	emit_signal("changeThemeRequest", "Dark mode")
