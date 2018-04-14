extends Tabs

var Manison = {} setget set_Manison,get_Manison

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Manison(key,value):
	Manison[key] = value

static func ___Getter___():pass

func get_Manison():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Manison_Props.call("get_%s"%i))
	return Manison

