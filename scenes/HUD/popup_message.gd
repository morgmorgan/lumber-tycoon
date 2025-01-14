extends CanvasLayer
class_name PopupMessage

var display_length_seconds = 3

func _ready():
	play()

func play():
	$AnimationPlayer.play("POP_IN")
	await $AnimationPlayer.animation_finished
	$DisplayTimer.start(1.5)
	await $DisplayTimer.timeout
	$AnimationPlayer.play("POP_OUT")
	await $AnimationPlayer.animation_finished
	# Kill yourself. ididiot.
	queue_free()

func set_text(in_text : String):
	$PanelContainer/Label.text = in_text

func end_early():
	$AnimationPlayer2.play("fade_early")
