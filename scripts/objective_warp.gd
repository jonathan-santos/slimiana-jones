extends Node

func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		$Timer.start()


func _on_Timer_timeout():
	warp()

func warp():
	get_tree().reload_current_scene()
