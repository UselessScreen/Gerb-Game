extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("../../../../Player")
	player.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var player = get_node("../../../../Player")
	player.show()
	player.position = Vector2(-1152, 288)
	
	
