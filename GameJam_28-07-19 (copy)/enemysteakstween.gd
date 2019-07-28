extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var steakdown = false
onready var speedysteak = 0.2
# Called when the node enters the scene tree for the first time.
func _ready():



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#runter
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
			self.position, self.position+Vector2(20,50), speedysteak,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

#hoch
func _on_Tween_tween_completed(object, key):

	if steakdown == true:
		var tween = get_node("Tween")
		tween.interpolate_property(self, "position",
				self.position, self.position+Vector2(20,50), speedysteak,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		steakdown = false
	else:
		steakdown = true
		var tween = get_node("Tween")
		tween.interpolate_property(self, "position",
				self.position, self.position-Vector2(20,50), speedysteak,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
