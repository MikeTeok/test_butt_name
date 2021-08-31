extends Control

onready var start_button = $Playbutton
onready var toggle_button = $toggle_button
signal startRequest
signal changeThemeRequest(theme_mode)
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	pass # Replace with function body.

func set_theme(new_theme):
	theme_mode = new_theme
	start_button.theme_mode = new_theme
	toggle_button.theme_mode = new_theme
	
func _on_Playbutton_pressed():
	emit_signal("startRequest")

func _on_toggle_button_changeThemeRequest(theme_mode):
	emit_signal("changeThemeRequest", theme_mode)
