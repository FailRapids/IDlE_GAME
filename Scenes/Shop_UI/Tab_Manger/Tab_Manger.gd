extends TabContainer

var tab_list = {}

func _ready():
	var tab_name
	for i in get_children():
		tab_name = i.call("get_%s"%i.get_name())["Name"]
		tab_list[tab_name] = i.get_position_in_parent()
	
func _on_pressed(Item_Name):
	if tab_list.has(Item_Name):
		set_current_tab(tab_list[Item_Name])