extends CanvasLayer

func _ready():
	$Panel.visible = false
	GameManager.interaction_target_changed.connect(on_interaction_target_changed)
	
func on_interaction_target_changed(target : InteractableComponent, interaction_text : String):
	if target == null:
		$Panel.visible = false
		return
		
	$Panel.visible = true
	$Panel/Label.text = interaction_text
