extends Node2D



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

#func on_newlevel():
	
#	load("res://Main02.gd")

func newgame():
	$background.play()

func _on_ItemArea_area_entered(area):
	print("item")


func _on_ItemArea_body_entered(body):
	print("item")
	$background.stop()
	$nextlevel.play()
	$ItemArea.queue_free()
		
	
func _on_nextlevel_finished():
	get_tree().change_scene("res://Alt01.tscn")
