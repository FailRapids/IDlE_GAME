extends Node
export(NodePath) var Building = NodePath("")
export(NodePath) var Jobs = NodePath("")
export(NodePath) var Upgrades = NodePath("")
export(NodePath) var Equment = NodePath("")
var Item_Inv = {"Trap":{"Current_Amnt":0,"Cost":0,"Ttb":0}} setget set_Item_Inv,get_Item_Inv

signal Update(Change)
signal PutItemInQueue(Name,key)

func _ready():
	var usernodes = get_children()
	for i in usernodes:
		for j in usernodes:
			if(j.is_in_group("Stores")):
				connect("Update",j,"on_Changed")
func _process(delta):
	self.Item_Inv = get_node(Building).get_Item_Inv(0)
func set_Item_Inv(key,value):
	Item_Inv[key] = value
	emit_signal("Update",Item_Inv)

	
func get_Item_Inv(key = null):
	if (key == null ):
		return Item_Inv
	elif(Item_Inv.has(key)):
		return Dictionary(Item_Inv[key])
	else:
		return null

func _on_User_Data_SendingNewTable(tables):
	for i in tables:
		if (i == "Item_Inv"):
			for j in tables[i]:
				if(tables[i][j] != Item_Inv[j]):
					set_Item_Inv(tables[i],tables[i][j])

func requestBuild( Name , Key ):
	##Name(Of Item),Props(Ammnt,cost,timetobuild)##
	emit_signal("PutItemInQueue",Name,Key)

