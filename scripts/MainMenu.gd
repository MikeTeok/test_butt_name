extends Control

onready var start_button = $CenterContainer/Playbutton
onready var theme_button = $CenterContainer/Playbutton/theme_button
onready var audio_button = $CenterContainer/Playbutton/audio_button
onready var sfx_button = $CenterContainer/Playbutton/sfx_button
onready var difficulty_slider = $CenterContainer/Playbutton/DifficultySlider
signal startRequest
signal changeThemeRequest
signal changeBGMRequest
signal changeSFXRequest
signal changeDifficultyRequest(level)
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	pass # Replace with function body.

func set_theme(new_theme):
	theme_mode = new_theme
	start_button.theme_mode = new_theme
	theme_button.theme_mode = new_theme
	audio_button.theme_mode = new_theme
	sfx_button.theme_mode = new_theme
	difficulty_slider.theme_mode = new_theme
	
func _on_Playbutton_pressed():
	emit_signal("startRequest")

func _on_theme_button_pressed():
	emit_signal("changeThemeRequest")

func _on_audio_button_pressed():
	emit_signal("changeBGMRequest")

func _on_sfx_button_pressed():
	emit_signal("changeSFXRequest")

func _on_DifficultySlider_value_changed(level):
	emit_signal("changeDifficultyRequest", level)
