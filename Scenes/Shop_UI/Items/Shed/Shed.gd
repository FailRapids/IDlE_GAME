extends Tabs

var Shed = {} setget set_Shed,get_Shed

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Shed(key,value):
	Shed[key] = value

static func ___Getter___():pass

func get_Shed():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Shed_Props.call("get_%s"%i))
	return Shed