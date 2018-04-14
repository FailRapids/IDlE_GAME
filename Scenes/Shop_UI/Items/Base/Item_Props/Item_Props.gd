extends Control



var Name_ = "1/1/1/1/Name"
var Amnt_ = "1/1/1/1/Amnt"
var Cost_ = "1/1/1/1/Cost"
var Buy_ = "1/1/1/2/Buy"
var Info_ = "1/1/1/Info"

export(String) var Name = "Base" 
var Cost = [{"Food":0},{"Wood":0},{"Metal":0},{"Science":0}]
export(String, MULTILINE) var Info = "Doubles Your Max Amnt -_- i geuss"


static func ___BulitIn___():pass

func _enter_tree():
	add_user_signal("Request_Build",[{"Item":TYPE_OBJECT}])
	add_user_signal("Try_To_Buy",[{"Item":TYPE_OBJECT}])
func _ready():
	get_node(Info_).add_text(Info)
		
func _process(delta):
	Update()

static func ___Helpers___():pass

func Update():
	get_node(Name_).set_text(Item.Name)
	get_node(Amnt_).set_text("x%d"%Item.Amnt)
	get_node(Cost_).set_text("")
	
	var Cost = Item.Cost
	for i in Cost:if Cost[i] > 0:
		get_node(Cost_).set_text(
			get_node(Cost_).get_text() 
				+ "%s:%d"%[i,Cost[i]])

func connect_signals(signalgroup="ALL"):
	match signalgroup :
		1:        
			for i in get_tree().get_nodes_in_group("Resource"):
				connect("Try_To_Buy",i,"on_Try_To_Buy")
				i.connect("Failed",self,"on_Failed")
				i.connect("Passed",self,"on_Passed")
			return 1
		2:
			for i in get_tree().get_nodes_in_group("Build_Queue"):
				connect("Request_Build",i,"on_Request")
				i.connect("Done",self,"on_Done")
			return 1
		0:
			return 0

func disconnect_signals(signalgroup = 0):
	match signalgroup:
		1:
			for i in get_tree().get_nodes_in_group("Resource"):
				disconnect("Try_To_Buy",i,"on_Try_To_Buy")
				i.disconnect("Failed",self,"on_Failed")
				i.disconnect("Passed",self,"on_Passed")
			return 1
		2:
			for i in get_tree().get_nodes_in_group("Build_Queue"):
				disconnect("Request_Build",i,"on_Request")
				i.disconnect("Done",self,"on_Done")
			return 1
		_:
			return 0

static func ___SignalFuncs___():pass

func _on_Buy_pressed():
	if connect_signals(1) and get_parent().has_method("get_%s"%Name):    
		emit_signal("Try_To_Buy",get_parent().call("get_%s"%Name))
	else:
		disconnect_signals(1)
		
func on_Passed():
	if connect_signals(2):
		emit_signal("Request_Build",Item)
		disconnect_signal(1)

func on_Failed():
	disconnect_signals(1)    


func asserttype(type = "NULL",value=null):
	match type:
		"TYPE_INT":
			assert(typeof(value) == TYPE_INT)
		"TYPE_STRING":
			assert(typeof(value) == TYPE_STRING)
		"":
			assert(false)
	return value