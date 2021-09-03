extends Node

onready var mainMenu = $MainMenu
onready var background = $Background
onready var game = $Game
onready var gameOverUI = $GameOverUI

onready var theme_mode = {true: "Light mode", false: "Dark mode"}
onready var global_theme = true
onready var bgm_mute = false
onready var sfx_mute = false

func _ready():
	pass # Replace with function body.

func set_theme(new_mode):
	game.theme_mode = new_mode
	background.theme_mode = new_mode
	mainMenu.theme_mode = new_mode
	gameOverUI.theme_mode = new_mode

func _on_MainMenu_startRequest():
	mainMenu.hide()
	game.show()
	game.play()
	
func _on_MainMenu_changeThemeRequest():
	global_theme = !global_theme
	set_theme(theme_mode[global_theme])
	
func _on_Game_gameOver(combo):
	game.halt()
	game.hide()
	gameOverUI.update_scoreboard(combo)
	gameOverUI.show()

func _on_GameOverUI_restartRequest():
	gameOverUI.hide()
	game.show()
	game.play()

func _on_GameOverUI_mainMenuRequest():
	gameOverUI.hide()
	mainMenu.show()

func _on_MainMenu_changeBGMRequest():
	bgm_mute = !bgm_mute
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), bgm_mute)

func _on_MainMenu_changeSFXRequest():
	sfx_mute = !sfx_mute
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), sfx_mute)
