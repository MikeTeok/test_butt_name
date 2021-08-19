extends Node2D

const INTERVAL = 1.0
onready var butt_note_scene = preload("res://scenes/butt.tscn")
onready var butt_bouncy_effect = preload("res://scenes/ButtBouncyEffect.tscn")
var animation_speed = 1.0
var butt_note_list = []

onready var comboUI = $ComboUI
onready var theme_mode setget set_theme

func _ready():
	init()
	add_butt_note()
	$Timer.start()

func _input(_delta):
	if(Input.is_action_just_pressed("ui_select")):
		delete_butt_note()

func init():
	set_theme("Dark mode")
	$Timer.wait_time = INTERVAL / animation_speed

func delete_butt_note():
	var butt_note_delete = butt_note_list.pop_front()
	if butt_note_delete != null:
		comboUI.hitState = butt_note_delete.state
		if butt_note_delete.state == "hit":
			var effect = butt_bouncy_effect.instance()
			effect.global_position = butt_note_delete.global_position
			effect.scale = butt_note_delete.scale
			add_child(effect)
		butt_note_delete.queue_free()

func add_butt_note():
	var butt_note = butt_note_scene.instance()
	butt_note.animation_speed = self.animation_speed
	butt_note.global_position = $"butt outline".global_position
	butt_note.z_index = -1
	butt_note_list.append(butt_note)
	add_child(butt_note)
	butt_note.connect("timeout",self,"_on_butt_timeout")

func _on_Timer_timeout():
	add_butt_note()

func _on_butt_timeout():
	delete_butt_note()

func set_theme(new_mode):
	theme_mode = new_mode
	$Background.theme_mode = new_mode
	$"butt outline".theme_mode = new_mode
