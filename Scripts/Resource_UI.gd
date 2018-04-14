extends Control

export(NodePath)var Food_ = NodePath("1/Food")
export(NodePath)var Wood_ = NodePath("1/Wood")
export(NodePath)var Metal_ = NodePath("1/Metal")
export(NodePath)var Science_ = NodePath("1/Science")

var Food = {} setget set_Food

var Wood = {} setget set_Wood

var Metal = {} setget set_Metal

var Science = {} setget set_Science




signal Failed
signal Passed

func _enter_tree():add_to_group("Resource")

func _ready():
	call_deferred("Popluate")

static func ___Setters___():
	pass

func set_Food(key,value):
	Food[key] = value
	match key:
		"Amnt":
				get_node(Food_).set_Current_Amnt(value)
		"Max_Amnt":
				get_node(Food_).set_Max_Amnt(value)
		"Base_Rate":
				get_node(Food_).set_Base_Rate(value)
		"Boosted_Rate":
				get_node(Food_).set_Boosted_Rate(value)

		
func set_Wood(key,value):
	Wood[key] = value
	####PUSH Changes Down 
	match key:
		"Amnt":
				get_node(Wood_).set_Current_Amnt(value)
		"Max_Amnt":
				get_node(Wood_).set_Max_Amnt(value)
		"Base_Rate":
				get_node(Wood_).set_Base_Rate(value)
		"Boosted_Rate":
				get_node(Wood_).set_Boosted_Rate(value)

	
func set_Metal(key,value):
	Metal[key] = value
	match key:
		"Amnt":
				Metal[key] = value
				get_node(Metal_).set_Current_Amnt(value)
		"Max_Amnt":
				Metal[key] = value
				get_node(Metal_).set_Max_Amnt(value)
		"Base_Rate":
				Metal[key] = value
				get_node(Metal_).set_Base_Rate(value)
		"Boosted_Rate":
				Metal[key] = value
				get_node(Metal_).set_Boosted_Rate(value)

		
func set_Science(key,value):
	var node  = get_node(Science_)
	match key:
		"Amnt":
				Science[key] = value
				node.set_Current_Amnt(value)
		"Max_Amnt":
				node.set_Max_Amnt(value)
		"Base_Rate":
				Science[key] = value
				node.set_Base_Rate(value)
		"Boosted_Rate":
				Science[key] = value
				node.set_Boosted_Rate(value)

func on_Try_To_Buy(Item):
	for i in Item["Cost"]:
		match i:
			"Food":
					if Item["Cost"][i] <= get_node(Food_).get_Current_Amnt():
							set_Food("Amnt",get_node(Food_).get_Current_Amnt()-Item["Cost"][i])
					else:
						if (OS.is_debug_build()):
							printerr("Failed to Buy %s"%[Item["Name"]])
							emit_signal("Failed")
							breakpoint
						else:
							emit_signal("Failed")
						return
			"Wood":
					if Item["Cost"][i] <= get_node(Wood_).get_Current_Amnt():
						set_Wood("Amnt",get_node(Wood_).get_Current_Amnt()-Item["Cost"][i])
					else:
						if (OS.is_debug_build()):
							printerr("Failed to Buy %s"%[Item["Name"]])
							emit_signal("Failed")
							breakpoint
						else:
							emit_signal("Failed")
						return
			"Metal":
					if Item["Cost"][i] <= get_node(Metal_).get_Current_Amnt():
						set_Metal("Amnt",get_node(Metal_).get_Current_Amnt()-Item["Cost"][i])
					else:
						if (OS.is_debug_build()):
							printerr("Failed to Buy %s"%[Item["Name"]])
							emit_signal("Failed")
							breakpoint
						else:
							emit_signal("Failed")
						return
			"Science":
					if Item["Cost"][i] <= get_node(Science_).get_Current_Amnt():
						set_Science("Amnt",get_node(Science_).get_Current_Amnt()-Item["Cost"][i])
					else:
						if (OS.is_debug_build()):
							printerr("Failed to Buy %s"%[Item["Name"]])
							emit_signal("Failed")
							breakpoint
						else:
							emit_signal("Failed")
						return

func Populate():
	for i in get_node("GridContainer").get_children():
		call("set_%s"%[i.get_name()],"Current_Amnt",i.get_Current_Amnt())
		call("set_%s"%[i.get_name()],"Max_Amnt",i.get_Max_Amnt())
		call("set_%s"%[i.get_name()],"Base_Rate",i.get_Base_Rate())
		call("set_%s"%[i.get_name()],"Boosted_Rate",i.get_Bosted_Rate())
	