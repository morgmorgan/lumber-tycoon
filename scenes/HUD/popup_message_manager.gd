extends Node

#@export var popup_message_scene : PackedScene 
var popup_message_scene = preload("res://scenes/HUD/popup_message.tscn")

func _ready():
	MessageDeus.message_requested.connect(on_message_requested)
	
func on_message_requested(in_text : String):
	play_message(in_text)
	
func play_message(text : String):
	var new_message : PopupMessage = popup_message_scene.instantiate()
	self.add_child(new_message)
	new_message.set_text(text)
	new_message.play()
