extends Node

# Player interaction
var player_interaction_target : InteractableComponent3D
var target_text : String
signal interaction_target_changed(new_target : InteractableComponent3D, interaction_text : String)

func _ready():
	player_interaction_target = null
	
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
		if player_interaction_target != null:
			player_interaction_target.interacted.emit()
