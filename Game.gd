extends Node2D

const INTERVAL = 1.0
onready var butt_note_scene = preload("res://butt/butt.tscn")
var animation_speed
var butt_note_list = []

func _ready():
	init()
	add_butt_note()

func _process(delta):
	pass

func _input(delta):
	if(Input.is_action_pressed("ui_select")):
		delete_butt_note()

func init(speed = 1.0):
	var butt_note = butt_note_scene.instance()
	var animation_time = butt_note.get_node("AnimationPlayer").get_animation("grow").length
	# maybe not needed
	butt_note.queue_free()
	animation_speed = 1.0 * speed
	$Timer.wait_time = animation_time * INTERVAL / speed

func delete_butt_note():
	var butt_note_delete = butt_note_list.pop_front()
	if butt_note_delete != null:
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
