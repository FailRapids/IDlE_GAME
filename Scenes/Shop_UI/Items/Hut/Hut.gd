extends Tabs

var Hut = {} setget set_Hut,get_Hut

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Hut(key,value):
	Hut[key] = value

static func ___Getter___():pass

func get_Hut():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Hut_Props.call("get_%s"%i))
	return Hut