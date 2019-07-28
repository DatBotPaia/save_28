extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Main_steakmove():
	$steakup.start()


func _on_steakup_timeout():
	position.y -= 30
	$steakup.stop()
	$steakdown.start()


func _on_steakdown_timeout():
	position.y += 30
	$steakdown.stop()
	$steakup.start()
