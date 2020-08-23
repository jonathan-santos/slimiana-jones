extends Camera

onready var player = get_tree().get_nodes_in_group("player")[0]

func _process(_delta):
	look_at(player.translation, Vector3.UP)
