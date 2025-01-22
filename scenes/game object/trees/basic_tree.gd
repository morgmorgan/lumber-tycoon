extends StaticBody3D

var health : int = 5

func _ready():
	$InteractableComponent3D.interacted.connect(on_interacted)
	
func on_interacted():
	if health >= 1:
		health -= 1
		MessageDeus.request_message("You gain some wood")
		StatsDeus.add_wood(1)
	
	if health <= 0:
		queue_free()
