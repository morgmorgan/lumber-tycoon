extends StaticBody3D

var checked : bool = false

func _ready():
	$InteractableComponent3D.interacted.connect(on_interacted)
	
func on_interacted():
	if checked:
		#print_debug("You've already checked this crate.")
		MessageDeus.request_message("You've already checked this crate.")
	else:
		#print_debug("You search the crate, but find nothing.")
		MessageDeus.request_message("You find a Beaver Coin in the crate!")
		StatsDeus.add_bc(1)
		checked = true
