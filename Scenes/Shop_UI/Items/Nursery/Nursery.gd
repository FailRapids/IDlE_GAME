extends Tabs

var Nursery = {} setget set_Nursery,get_Nursery

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Nursery(key,value):
	Nursery[key] = value

static func ___Getter___():pass

func get_Nursery():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Nursery_Props.call("get_%s"%i))
	return Nursery