extends Tabs

var Forge = {} setget set_Forge,get_Forge

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Forge(key,value):
		Forge[key] = value

static func ___Getter___():pass

func get_Forge():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Forge_Props.call("get_%s"%i))
	return Forge