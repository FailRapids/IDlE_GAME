extends VBoxContainer

export(NodePath) var Number_Breeding_ = "Number_Breading"
export(NodePath) var Rate_ = "Rate"
export(NodePath) var Amnt_Working_ = "Amnt_Working"

var Rate = 0.0 setget set_Rate
var notWorking= 0 setget set_notWorking
var Working = 0 setget set_Working
var maxWorking = 0 setget set_maxWorking
var Trimp_Inv = {"Current_Amnt":0,"Max_Amnt":10,"maxWorking":5,"Working":0,"notWorking":0} setget set_Trimp_Inv
func Update():
	get_node(Number_Breeding_).set_text("%d"%[notWorking])
	get_node(Rate_).set_text("%1.2f"%[Rate])
	get_node(Amnt_Working_).set_text("%d"%[Working])
	
func set_Working(value):
	Working = value

func set_notWorking(value):
	notWorking = value
	Update()
	
func set_Trimp_Inv(key,value):
	Trimp_Inv[key] = value
	if(key == "notWorking"):
		set_notWorking(value)
	if(key == "Working"):
		set_Working(value)
	if(key == "maxWorking"):
		set_maxWorking(value)
		
func set_Rate(value):
	Rate = float(value)
	Update()
	
func set_maxWorking(value):
	maxWorking = value

