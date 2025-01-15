extends Area3D
class_name InteractableComponent3D

@export var interactable : bool = true
@export_multiline var interaction_text : String

signal interacted

func _ready():
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	
# Handles player entering / exiting interaction zone
func on_body_entered(other : Node3D):
	if interactable and other.is_in_group("player"):
		GameManager.set_player_interaction_target(self)
	
func on_body_exited(other : Node3D):
	if other.is_in_group("player"):
		GameManager.set_player_interaction_target(self, false)
