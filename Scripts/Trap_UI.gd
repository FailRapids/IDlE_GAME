extends MarginContainer


export(NodePath) var Button_ = "1/1/Check_Traps"
export(NodePath) var Bar_ = "1/1/ProgressBar"
var Item_Inv = {"Trap":0}
var Trap = 0 setget set_Trap,get_Trap
signal Trap_Changed
signal add_trimp(key,value)

func _process(delta):
	Update()
func set_Trap(value):
	Trap = value

func get_Trap():
	return Trap
	
func set_Item_Inv(key,value):
	Item_Inv[key] = value
	if(key == "Trap"):
		set_Trap(value)
	
func _on_Check_Traps_toggled( button_pressed ):
	Button_Toggle(button_pressed)
	
func Button_Toggle(State):
	if (State == true):
		if(Trap>0):
			get_node(Button_).set_text("Checking(%d)"%[Trap])
			get_node(Button_).set_pressed(State)
			get_node("Timer").start()
			get_node("Timer").set_paused(not(State))
		else:
			get_node(Button_).set_text("Check Traps")
			get_node(Button_).set_pressed(not(State))
			get_node("Timer").set_paused(State)
	elif(State == false):
		if(Trap>0):
			get_node(Button_).set_text("Check(%d)"%[Trap])
			get_node(Button_).set_pressed(State)
			get_node("Timer").set_paused(not(State))
		else:
			get_node(Button_).set_text("Check Traps")
			get_node(Button_).set_pressed(State)
			get_node("Timer").set_paused(not(State))

func Update():
	get_node(Bar_).set_max(get_node("Timer").get_wait_time())
	get_node(Bar_).set_value((get_node("Timer").get_time_left()))
	
func _on_Timer_timeout():
	emit_signal("add_trimp","Current_Amnt",1)
	set_Trap(Trap - 1)
	Button_Toggle(false)
	get_node(Bar_).set_value(0)
	Update()
	
