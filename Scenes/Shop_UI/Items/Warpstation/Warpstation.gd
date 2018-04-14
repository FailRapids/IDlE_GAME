extends Tabs

var Warpstation = {} setget set_Warpstation,get_Warpstation

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Warpstation(key,value):
	Warpstation[key] = value

static func ___Getter___():pass

func get_Warpstation():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Warpstation_Props.call("get_%s"%i))
	return Warpstation