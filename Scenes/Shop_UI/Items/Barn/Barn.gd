extends Tabs

var Barn = {} setget set_Barn,get_Barn

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Barn(key,value):
	Barn[key] = value

static func ___Getter___():pass

func get_Barn():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Barn_Props.call("get_%s"%i))
	return Barn