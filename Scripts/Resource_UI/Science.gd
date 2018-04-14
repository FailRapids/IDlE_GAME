extends Control
export(String) var Name = "Science"
export(String) var Button_Down = "Researching"
export(String) var Button_Up = "Research"

export(int) var Current_Amnt = 0 setget set_Current_Amnt,get_Current_Amnt
export(int) var Max_Amnt = -1 setget set_Max_Amnt,get_Max_Amnt

export(float) var Base_Rate = 0 setget set_Base_Rate,get_Base_Rate
export(float) var Current_Rate = 0 
export(float) var Boosted_Rate = 1 setget set_Boosted_Rate,get_Boosted_Rate


export(NodePath) var Name_ = NodePath("1/1/Name")
export(NodePath) var Amnt_ = NodePath("1/1/Amnt")
export(NodePath) var Rate_ = NodePath("1/2/1/Rate")
export(NodePath) var Button_ = NodePath("1/2/1/Button")

var time = float(0)

func _enter_tree():
	add_to_group("HelpAble")
	add_user_signal("Button_is_pressed")

func _ready():
	for i in get_tree().get_nodes_in_group("HelpAble"):
		if(i != self):
			connect("Button_is_pressed",i,"is_others_button_pressed")
	
func _process(delta):
	calc_Amnt(delta)
	
	
func ___Setters___():
	pass
	
func set_Current_Amnt(value):
	Current_Amnt = value
	
func set_Max_Amnt(value):
	Max_Amnt = -1
	
func set_Base_Rate(value):
	Base_Rate = value

func set_Boosted_Rate(value):
	Boosted_Rate = value

###############################################################################

func ___Getters___():
	pass
func get_Current_Amnt():
	return Current_Amnt

func get_Max_Amnt():
	return Max_Amnt

func get_Base_Rate():
	return Base_Rate

func get_Boosted_Rate():
	return Boosted_Rate

###############################################################################

func ___SignalFuncs___():
	pass

func _on_Button_toggled( button_pressed ):
	button_toggle(button_pressed)

func is_others_button_pressed():
	button_toggle(false)

###############################################################################

func ___Helpers___():
	pass

func Update():
	get_node(Name_).set_text(Name)
	get_node(Amnt_).set_text("%d"%[Current_Amnt])
	get_node(Rate_).set_text("+%d.0/sec"%[Current_Rate])
	
	
func calc_Amnt(delta):
	time += delta
	if (time <= 1):
		set_Current_Amnt(Current_Amnt +(Current_Rate * delta))
	else:
		time = 0
	Update()
	
func button_toggle(button_pressed):
	get_node(Button_).set_pressed(button_pressed)
	if (button_pressed):
		emit_signal("Button_is_pressed")
		Current_Rate = Base_Rate + Boosted_Rate
		get_node(Button_).set_text(Button_Down)
	else:
		Current_Rate = Base_Rate
		get_node(Button_).set_text(Button_Up)
	Update()
