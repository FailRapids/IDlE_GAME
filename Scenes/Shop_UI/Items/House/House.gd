extends Tabs

var House = {} setget set_House,get_House

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_House(key,value):
	House[key] = value

static func ___Getter___():pass

func get_House():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$House_Props.call("get_%s"%i))
	return House