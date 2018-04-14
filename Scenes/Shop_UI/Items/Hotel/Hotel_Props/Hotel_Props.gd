extends PanelContainer

############################################
# Hotel_Props.gd
#		Signals
#			Request_Build
#				deps Build_Queue
#			Try_To_Buy
#				deps Resourse_Node
#	*TODO
#		possable bug test and fix
#			on set cost_*
#			Cost struct doesnt update till next get call
############################################

export(NodePath) var Name_ = "1/1/1/Name"
export(NodePath) var Amnt_ = "1/1/1/Amnt"
export(NodePath) var Cost_ = "1/1/1/Cost"
export(NodePath) var Buy_ = "1/1/2/Buy"
export(NodePath) var Sell_ = "1/1/2/Sell"
export(NodePath) var Info_ = "1/1/Info"

export(String) var Name = "Hotel" setget set_Name,get_Name

export(String, MULTILINE) var Info = "Doubles Your Max Amnt -_- i geuss"

export(int) var Amnt = 0 setget set_Amnt,get_Amnt

export(int) var Cost_Food = 10 setget set_Cost_Food
export(int) var Cost_Wood = 10 setget set_Cost_Wood
export(int) var Cost_Metal = 0 setget set_Cost_Metal
export(int) var Cost_Science = 0 setget set_Cost_Science

export(int) var Time = 0 setget set_Time,get_Time

static func ___BulitIn___():pass

func _enter_tree():
	add_user_signal("Request_Build",[{"Item":TYPE_DICTIONARY}])
	add_user_signal("Try_To_Buy",[{"Item":TYPE_DICTIONARY}])

func _process(delta):Update()

static func  ___Setters___():pass

func set_Name(value):Name = value

func set_Amnt(value):Amnt = value

func set_Cost_Food(value):Cost_Food = value

func set_Cost_Wood(value):Cost_Wood = value

func set_Cost_Metal(value):Cost_Metal = value

func set_Cost_Science(value):Cost_Science = value

func set_Time(value):Time = value

static func ___Getters___():pass

func get_Name():return Name

func get_Amnt():return Amnt

func get_Cost():
	var scalefactor = float((.25)*(500*(Amnt+1)))
	var Cost = {"Food":Cost_Food+scalefactor,"Wood":Cost_Wood+scalefactor,"Metal":Cost_Metal,"Science":Cost_Science}
	return Cost

func get_Time():return Time

static func ___Helpers___():pass

func Update():
	get_node(Name_).set_text(Name)
	get_node(Amnt_).set_text("x%d"%Amnt)
	get_node(Info_).set_text(Info)
	get_node(Cost_).set_text("")
    ####Much Faster
	var Cost = get_Cost()
	for i in Cost:if Cost[i] > 0:
		get_node(Cost_).set_text(
			get_node(Cost_).get_text()
				+ "%s:%d"%[i,Cost[i]])

func connect_signals(signalgroup = 0):
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
	var node
	match signalgroup:
		1:
			for i in get_tree().get_nodes_in_group("Resource"):
				disconnect("Try_To_Buy",i,"on_Try_To_Buy")
				i.disconect("Failed",self,"on_Failed")
				i.disconect("Passed",self,"on_Passed")
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
	if connect_signals(1):
		emit_signal("Try_to_Buy",get_parent().call("get_%s"%Name))

func on_Passed():
	if connect_signals(2):
		emit_signal("Request_Build",get_parent().call("get_%s"%Name))
		disconnect_signal(1)

func on_Failed():
	disconnect_signals(1)
	breakpoint
