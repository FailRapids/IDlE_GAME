extends Tabs

var Collector = {} setget set_Collector,get_Collector

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Collector(key,value):
	Collector[key] = value

static func ___Getter___():pass

func get_Collector():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Collector_Props.call("get_%s"%i))
	return Collector