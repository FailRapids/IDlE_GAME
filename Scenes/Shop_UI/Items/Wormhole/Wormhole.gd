extends Tabs

var Wormhole = {} setget set_Wormhole,get_Wormhole

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Wormhole(key,value):
	Wormhole[key] = value

static func ___Getter___():pass

func get_Wormhole():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Wormhole_Props.call("get_%s"%i))
	return Wormhole