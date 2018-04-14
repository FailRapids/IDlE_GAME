extends Tabs

var Dimensional_Generator = {} setget set_Dimensional_Generator,get_Dimensional_Generator

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Dimensional_Generator(key,value):
	Dimensional_Generator[key] = value

static func ___Getter___():pass

func get_Dimensional_Generator():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Dimensional_Generator_Props.call("get_%s"%i))
	return Dimensional_Generator