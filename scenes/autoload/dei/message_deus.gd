extends Node

signal message_requested(text : String)

func request_message(in_text : String):
	message_requested.emit(in_text)
