extends Node2D

onready var butt_note_scene = preload("res://butt/butt.tscn")
onready var butt_note = butt_note_scene.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	butt_note.global_position = $"butt outline".global_position
	butt_note.z_index = -1
	add_child(butt_note)
	
func _process(delta):
	if(Input.is_action_pressed("ui_select")):
		var note = get_node_or_null("ButtNote")
		if note != null:
			note.queue_free()
	

