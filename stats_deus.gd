extends Node

var num_wood : int
var num_bc : int

signal wood_value_changed(value : int)
signal bc_value_changed(value : int)

func _ready():
	num_bc = 0
	num_wood = 0
	wood_value_changed.emit(num_wood)
	bc_value_changed.emit(num_bc)

func add_bc(value : int):
	num_bc += value
	bc_value_changed.emit(num_bc)
	
func add_wood(value : int):
	num_wood += value
	wood_value_changed.emit(num_wood)
