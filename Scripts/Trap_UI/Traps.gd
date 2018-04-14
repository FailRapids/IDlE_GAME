extends MarginContainer


export(NodePath) var Button_ = "1/1/Check_Trapss"
export(NodePath) var Bar_ = "1/1/ProgressBar"

var Trap = 0 setget set_Trap,get_Trap
signal Trap_Changed
signal add_trimp

func set_Trap(value):
	Trap = value
	emit_signal("Trap_Changed")
func get_Trap():
	return Trap

	
func _on_Check_Trapss_toggled( button_pressed ):
	if (button_pressed):
		if(Trap>0):
			get_node(Button_).set_text("Checking(%d)"%[Trap])
			get_node("Timer").start()
			get_node("Timer").set_paused(false)
			get_parent().
		else:
			get_node(Button_).set_text("Check(%d)"%[Trap])
			get_node(Button_).set_pressed(false)
	else:
		get_node("Timer") .set_paused(true)
	Update()

func Update():
	get_node(Bar_).set_max(get_node("Timer").get_wait_time())
	get_node(Bar_).set_value((get_node("Timer").get_time_left()/get_node("Timer").get_wait_time())*10)
		
	print("%d/%d"%[get_node("Timer").get_wait_time(),get_node("Timer").get_time_left()])
func _on_Timer_timeout():
	get_node(Button_).set_pressed(false)
	emit_signal("add_trimp")
	if(Trap > 0):
		set_Trap(Trap - 1)
		emit_signal("Trap_Changed")
	Update()
