extends Camera3D

var target_position = Vector3.ZERO

func _ready():
	make_current()

func _process(_delta):
	acquire_target()

func acquire_target():
	var player : Node3D = get_tree().get_first_node_in_group("player")
	if player != null:
		global_position = player.global_position
