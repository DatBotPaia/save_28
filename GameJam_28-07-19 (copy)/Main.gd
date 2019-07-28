extends Node2D

signal game_over
onready var timescore = 30

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$Player01.hide()
	$ItemArea.hide()
	$Label.hide()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_HUD_start_game():
	print("start")
	$background.play()
	$Player01.show()
	$ItemArea.show()
	$TimeLimit.start()
	

func _on_ItemArea_area_entered(area):
	print("item")


func _on_ItemArea_body_entered(body):
	print("item")
	$background.stop()
	$nextlevel.play()
	$ItemArea.queue_free()
		
	
func _on_nextlevel_finished():
	get_tree().change_scene("res://Main_next01.tscn")





func _on_death_zone_body_entered(body):
	print("dead")
	emit_signal("game_over")
	


func _on_Main_game_over():
	$Label.show()
	$background.stop()
	$GameoverTimer.start()
	$fail.play()



func _on_GameoverTimer_timeout():
	get_tree().change_scene("res://Main.tscn")


func _on_TimeLimit_timeout():
	timescore -= 1
	$HUD/TimeLabel.text = str(timescore)
	if timescore == 0:
		$TimeLimit.stop()
		emit_signal("game_over")
