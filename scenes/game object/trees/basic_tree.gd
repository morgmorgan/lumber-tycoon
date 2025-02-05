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
		die()

func die(respawn : bool = true):
	$InteractableComponent3D.interactable = false
	$InteractableComponent3D.remove_self_as_target()
	$AnimationPlayer.play("fall")
	await $AnimationPlayer.animation_finished
	
	$RespawnTimer.start(StatsDeus.tree_respawn_time_seconds)
	await $RespawnTimer.timeout
	
	if respawn:
		spawn()

func spawn():
	$AnimationPlayer.play("spawn")
	await $AnimationPlayer.animation_finished
	$InteractableComponent3D.interactable = true
	current_health = max_health
	
