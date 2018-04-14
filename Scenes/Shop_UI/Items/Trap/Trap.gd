extends Tabs

var Trap = {} setget set_Trap,get_Trap

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Trap(key,value):
	Trap[key] = value

static func ___Getter___():pass

func get_Trap():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Trap_Props.call("get_%s"%i))
	return Trap