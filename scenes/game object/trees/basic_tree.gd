extends StaticBody3D

var health : int = 5

func _ready():
	$InteractableComponent3D.interacted.connect(on_interacted)
	
func on_interacted():
	$AnimationPlayer.play("shake")
	$visuals/Dust.restart()
	
	if health >= 1:
		health -= 1
		MessageDeus.request_message("You gain some wood")
		StatsDeus.add_wood(1)
	
	if health <= 0:
		$InteractableComponent3D.interactable = false
		$visuals/tree1.visible = false
		
		await $visuals/Dust.finished
		queue_free()
