extends CanvasLayer

func _ready():
	StatsDeus.wood_value_changed.connect(set_wood)
	StatsDeus.bc_value_changed.connect(set_bc)
	set_bc(StatsDeus.num_bc)
	set_wood(StatsDeus.num_wood)
	
func set_bc(in_number : int):
	%BCNumber.text = str(in_number)
	
func set_wood(in_number : int):
	%WoodNumber.text = str(in_number)
