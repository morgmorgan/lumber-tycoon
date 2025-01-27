extends Node

# Player interaction
var player_interaction_target : InteractableComponent3D
var target_text : String
var player_can_interact : bool
var player_interaction_delay := 0.5 # Time in seconds
signal interaction_target_changed(new_target : InteractableComponent3D, interaction_text : String)

func _ready():
	player_interaction_target = null
	player_can_interact = true
	
func set_player_interaction_target(target : InteractableComponent3D, make_current : bool = true):
	if !make_current:
		if player_interaction_target == target:
			player_interaction_target = null
			target_text = ""
	else:
		player_interaction_target = target
		target_text = player_interaction_target.interaction_text
		
	interaction_target_changed.emit(player_interaction_target, target_text)

func _input(event):
	if event.is_action_pressed("interact"):
		if player_can_interact:
			if player_interaction_target != null:
				player_interaction_target.interacted.emit()
				interaction_delay()

func interaction_delay():
	player_can_interact = false
	await get_tree().create_timer(player_interaction_delay).timeout
	player_can_interact = true
