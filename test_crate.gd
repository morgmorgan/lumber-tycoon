extends StaticBody2D

var checked : bool = false

func _ready():
	$InteractableComponent.interacted.connect(on_interacted)
	
func on_interacted():
	if checked:
		print_debug("You've already checked this crate.")
	else:
		print_debug("You search the crate, but find nothing.")
		checked = true
