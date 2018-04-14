extends Tabs

var Items = {} setget set_Items,get_Items
func _ready():
	call_deferred("get_Item")
func _process(delta):pass
	

	
func set_Items(key,value):
	var children = get_node("1/Tab_Manger").get_children()
	Items[key] = value
	if value:
		for j in children:
			if j.get_name() == value["Name"]:
				for i in value.keys():
					j.call("set_%s"%[j.get_name()],i,value[i])

func get_Items():
	var children = get_node("1/Tab_Manger").get_children()
	for i in children:
		if get_node("1/Tab_Manger").has_node(i.get_path()):
			var Item_Props = i.call("get_%s"%[i.get_name()])
			set_Items(i.get_name(),Item_Props)