extends GridContainer
tool
signal _pressed(idx)

func send_idx(button_item):
	emit_signal("_pressed",button_item)




func _on_Trap_pressed():
	send_idx("Trap")
	
func _on_Barn_pressed():
	send_idx("Barn")
	
func _on_Shed_pressed():
	send_idx("Shed")
	
func _on_Forge_pressed():
	send_idx("Forge")

func _on_Hut_pressed():
	send_idx("Hut")
	
func _on_House_pressed():
	send_idx("House")

func _on_Manison_pressed():
	send_idx("Manison")

func _on_Hotel_pressed():
	send_idx("Hotel")

func _on_Resort_pressed():
	send_idx("Resort")

func _on_Gateway_pressed():
	send_idx("Gateway")
	

func _on_Wormhole_pressed():
	send_idx("Wormhole")

func _on_Collector_pressed():
	send_idx("Collector")

func _on_Gym_pressed():
	send_idx("Gym")

func _on_Tribute_pressed():
	send_idx("Tribute")

func _on_Nursery_pressed():
	send_idx("Nursery")

func _on_Exit_pressed():
	send_idx("???Exit???")
