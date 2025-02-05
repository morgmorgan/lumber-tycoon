extends StaticBody3D

var max_health : int = 5
var current_health : int

func _ready():
	current_health = max_health
	$InteractableComponent3D.interacted.connect(on_interacted)
	
func on_interacted():
	$AnimationPlayer.play("shake")
	$visuals/Dust.restart()
	
	if current_health >= 1:
		current_health -= 1
		MessageDeus.request_message("You gain some wood")
		StatsDeus.add_wood(1)
	
	if current_health <= 0:
		$InteractableComponent3D.interactable = false
		$AnimationPlayer.play("fall")
		await $AnimationPlayer.animation_finished
		await $visuals/Dust.finished
		$visuals/tree1.visible = false
		queue_free()
