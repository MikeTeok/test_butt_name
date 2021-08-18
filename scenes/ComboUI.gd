extends Control

onready var comboLabel = $"Combo Label"
onready var hitLabel = $"Hit Label"
onready var combo = 0 
onready var hitState = "" setget set_hitState

func _ready():
	comboLabel.set_text("")
	hitLabel.set_text("")

func set_hitState(state):
	hitState = state
	hitLabel.set_text(hitState.to_upper())
	match hitState:
		"hit":
			combo += 1
		"miss":
			combo = 0
	
	if(combo > 1):
		comboLabel.set_text(String(self.combo) + "\nCOMBO")
	else:
		comboLabel.set_text("")
	
