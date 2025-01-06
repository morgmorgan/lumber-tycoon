extends Area2D
class_name InteractableComponent

func _ready():
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	
func on_body_entered(other : Node2D):
	#if not other.is_in_group("player"):
	#	return
	print_debug("Player Entered!")

	
func on_body_exited(other : Node2D):
	pass
