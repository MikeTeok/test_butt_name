extends Node2D

onready var animation = $AnimationPlayer
var animation_speed
var state = "miss"

signal timeout

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.playback_speed = self.animation_speed
	yield(animation, "animation_finished")
	emit_signal("timeout")
