extends Control

onready var start_button = $Playbutton
onready var theme_button = $theme_button
onready var audio_button = $audio_button
onready var sfx_button = $sfx_button
signal startRequest
signal changeThemeRequest
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	pass # Replace with function body.

func set_theme(new_theme):
	theme_mode = new_theme
	start_button.theme_mode = new_theme
	theme_button.theme_mode = new_theme
	audio_button.theme_mode = new_theme
	sfx_button.theme_mode = new_theme
	
func _on_Playbutton_pressed():
	emit_signal("startRequest")

func _on_theme_button_pressed():
	emit_signal("changeThemeRequest")
