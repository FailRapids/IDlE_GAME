extends Tabs

var Tribute = {} setget set_Tribute,get_Tribute

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Tribute(key,value):
	Tribute[key] = value

static func ___Getter___():pass

func get_Tribute():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Tribute_Props.call("get_%s"%i))
	return Tribute