extends Node

onready var mainMenuUI = $MainMenuUI
onready var background = $Background
onready var game = $Game
onready var gameOverUI = $GameOverUI

func _ready():
	pass # Replace with function body.

func set_theme(new_mode):
	game.theme_mode = new_mode
	background.theme_mode = new_mode
	mainMenuUI.theme_mode = new_mode
	gameOverUI.theme_mode = new_mode

func _on_MainMenuUI_startRequest():
	mainMenuUI.hide()
	game.show()
	game.play()
	
func _on_MainMenuUI_changeThemeRequest(theme_mode):
	set_theme(theme_mode)
	
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
	mainMenuUI.show()
