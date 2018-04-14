extends PanelContainer

export(NodePath) var Status_T_ = NodePath("Amnt_Status")
export(NodePath) var Status_B_ = NodePath("Trimp_Status")
export(NodePath) var Trap_ = NodePath("Traper")

signal Trap(value) 

var Item_Inv = {"Trap":0} 
var Trimp_Inv = {"Current_Amnt":0,"Max_Amnt":10,
									"maxWorking":5,"Working":0,"notWorking":0}  
#var Inv = {"Food":0,"Wood":0,"Metal":0,"Science":0}
func _ready():
	Update()

func _process(delta):
	set_Item_Inv("Trap",get_node(Trap_).get_Trap())
	set_Trimp_Inv("Current_Amnt",get_node(Status_T_).get_Current_Amnt())
	#set_Trimp_Inv("Max_Amnt",get_node(Status_T_).get_Max_Amnt())
	
	Update()

func Update():
	if has_node(Status_T_):
		get_node(Status_T_).set_Current_Amnt(Trimp_Inv["Current_Amnt"])
		get_node(Status_T_).set_Max_Amnt(Trimp_Inv["Max_Amnt"])
	elif(OS.is_debug_build()):
		print("%s : isnt Ready Yet"%[get_name()])
	if(has_node(Status_B_)):
		get_node(Status_B_).set_maxWorking(Trimp_Inv["maxWorking"])
		get_node(Status_B_).set_Working(Trimp_Inv["Working"])
		get_node(Status_B_).set_notWorking(Trimp_Inv["notWorking"])
	elif(OS.is_debug_build()):
		print("%s : isnt Ready Yet")
	if(has_node(Trap_)):
		if(Item_Inv["Trap"]):
			get_node(Trap_).set_Trap(Item_Inv["Trap"])
	elif(OS.is_debug_build()):
		print("%s : isnt Ready Yet")
		
func get_Trimp_Inv(key):
	return Trimp_Inv[key]

func set_Trimp_Inv(key,value):
	Trimp_Inv[key] = value
	
func get_Item_Inv(key):
	return Item_Inv[key]
	
func set_Item_Inv(key,value):
	Item_Inv[key] = value
	


	
func _on_User_Data_SendingNewTable( tables ):
	for i in tables:
		for j in tables[i]: 
			if( i == "Item_Inv"):
				get_node(Trap_).set_Item_Inv(j,tables[i][j])
			if(i == "Trimp_Inv"):
				get_node(Status_T_).set_Trimp_Inv(j,tables[i][j])
				get_node(Status_B_).set_Trimp_Inv(j,tables[i][j])
								
